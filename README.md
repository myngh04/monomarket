<p align="center">
  <img src="src/main/resources/static/images/logo.png" width="500" alt="MonoMarket logo">
</p>

<p>A Spring Boot recommerce platform for books, manga, DVD/Blu-ray, games, consoles, and accessories.</p>

MonoMarket is a server-rendered monolith combining a storefront, serialized secondhand inventory, checkout, user accounts, and a C2B buyback workflow. It also exposes a versioned REST API for products, carts, CSRF tokens, and authenticated account data.

## Features

- Product catalog with category/platform filters, pagination, and product detail pages.
- Serialized inventory: every physical item is a unique `InventoryItem` with its own price, condition, status, and store code.
- Guest carts backed by `MONO_GUEST_TOKEN`, authenticated carts, and guest-cart merge after login.
- Checkout with pessimistic inventory locking and protection against concurrent double-selling.
- Registration, form login, profile management, order history, and ownership checks.
- Customer Buyback flow with ISBN/JAN lookup, condition validation, estimated pricing, history, and ownership protection.
- Staff/Admin Buyback operations: review queue, inspection, final pricing, acceptance, payment marker, audit history, and inventory intake.
- PostgreSQL schema management with Flyway and a large catalog seed for books, manga, video, and games.
- OpenAPI 3 documentation and Swagger UI.
- Docker Compose for the application and PostgreSQL.
- GitHub Actions for tests, Docker Hub publishing, versioned image tags, and Azure App Service deployment.

## Architecture

```text
Browser / API client
        │
        ▼
Spring MVC controllers ──► Services ──► Repositories ──► PostgreSQL
        │                         │
        │                         └── business rules, transactions,
        │                             ownership and inventory locking
        ▼
Thymeleaf views or JSON responses
```

The MVC storefront and REST API use the same services and database. An item added through the API is therefore visible in the web cart, and web actions are visible through the API.

The application runs with Open Session in View disabled. Catalog and detail data is loaded explicitly before rendering so templates do not depend on lazy queries during view rendering.

## Domain model

```text
User
├── Cart
│   └── CartItem ──► InventoryItem ──► Product ──► Category
├── Order
│   └── OrderItem ──► InventoryItem
└── BuybackRequest
    ├── BuybackRequestItem ──► Product
    └── BuybackRequestStatusHistory ──► User
```

`Product` is the catalog identity, usually identified by ISBN/JAN. `InventoryItem` is one physical unit. A `CartItem` consequently represents one physical item; there is no quantity field for serialized inventory.

## Tech stack

| Area | Technology |
|---|---|
| Runtime | Java 21 |
| Framework | Spring Boot 3.4.1 |
| Web/UI | Spring MVC, Thymeleaf, HTML5, CSS3 |
| Security | Spring Security, BCrypt, form login, CSRF |
| Persistence | Spring Data JPA, Hibernate |
| Database | PostgreSQL 18.1, JSONB |
| Migrations | Flyway |
| Testing | JUnit 5, Mockito, MockMvc, AssertJ, H2 |
| Integration testing | Testcontainers with PostgreSQL 18.1 |
| Build | Maven Wrapper |
| API docs | springdoc OpenAPI 3, Swagger UI |

## REST API

The API is versioned under `/api/v1` and returns JSON.

| Method | Endpoint | Access |
|---|---|---|
| `GET` | `/api/v1/products` | Public product list |
| `GET` | `/api/v1/products/{productId}` | Public product detail |
| `GET` | `/api/v1/cart` | Guest or authenticated cart |
| `POST` | `/api/v1/cart` | Add one inventory item; CSRF required |
| `DELETE` | `/api/v1/cart/items/{inventoryItemId}` | Remove one item; CSRF required |
| `DELETE` | `/api/v1/cart` | Clear cart; CSRF required |
| `GET` | `/api/v1/csrf` | Get a CSRF token for API clients |
| `GET` | `/api/v1/account/profile` | Authenticated user profile |
| `GET` | `/api/v1/account/orders` | Authenticated user's orders |
| `GET` | `/api/v1/account/orders/{orderId}` | Authenticated order detail with ownership check |

Interactive documentation is available at `http://localhost:8081/swagger-ui/index.html`. The OpenAPI document is available at `/v3/api-docs/monomarket-api`.

For a state-changing API request, first call `GET /api/v1/csrf` with the same session, then send the returned token in the `X-CSRF-TOKEN` header. Keep the session cookie as well. Spring Security CSRF protection remains enabled for both the web application and API.

## Run locally with Docker

Prerequisite: Docker Desktop.

```powershell
Copy-Item .env.example .env
docker compose up --build -d
```

Set a local `POSTGRES_PASSWORD` in `.env` before starting. The default ports are:

| Service | Host address | Container address |
|---|---|---|
| MonoMarket | `http://localhost:8081` | `server:8080` |
| PostgreSQL | `localhost:5433` | `db:5432` |

```powershell
docker compose logs -f server
docker compose ps
docker compose down
```

`docker compose down` keeps the PostgreSQL volume. Use `docker compose down -v` only when the local database can be deleted and Flyway should recreate it. The IDE can run alongside Docker: use port `8080` for the IDE application and `8081` for Compose. More Docker notes are in [README.Docker.md](README.Docker.md).

## Run without Docker

Create `src/main/resources/application.yaml` from `application.yaml.example`, configure a local PostgreSQL database, then run:

```powershell
.\mvnw.cmd spring-boot:run
```

The local application uses port `8080` by default. Flyway creates and validates the schema on startup.

## Test and verify

```powershell
.\mvnw.cmd verify
```

The suite includes controller, service, repository, application-context, OpenAPI documentation, and PostgreSQL Testcontainers integration tests. The latest local verification covered **109 tests with 0 failures and 0 errors**; Docker Desktop must be running for the PostgreSQL integration test.

## CI/CD

`.github/workflows/ci.yml` runs on pull requests and pushes to `main`:

1. Run Maven `verify` on Java 21.
2. After tests pass, publish `myngh4/monomarket:<commit-sha>` and `myngh4/monomarket:latest` to Docker Hub.
3. On a `vX.Y.Z` Git tag, create an immutable versioned Docker image tag.
4. Deploy the selected image to Azure App Service with OIDC when production configuration is present.
5. Wait for `/actuator/health` and smoke-test `GET /api/v1/products`.

CI credentials stay in GitHub Secrets/Variables. Never commit `.env`, Docker Hub tokens, Azure credentials, database passwords, or production `application.yaml`.

## Docker image

The published image is available at [Docker Hub — myngh4/monomarket](https://hub.docker.com/r/myngh4/monomarket).

```powershell
docker pull myngh4/monomarket:latest
```

For a reproducible release, use a commit SHA or version tag instead of `latest`.
