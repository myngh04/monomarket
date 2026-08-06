<p align="center">
  <img src="src/main/resources/static/images/logo.png" width="500">
</p>

MonoMarket is a server-rendered recommerce platform for books, manga, DVD/Blu-ray, games, consoles, and entertainment accessories.

The project combines two business flows:

- **B2C:** the store sells new and inspected secondhand inventory to customers.
- **C2B Buyback:** authenticated users submit catalog-matched products for inspection and an estimated buyback price.

MonoMarket is currently a personal learning project focused on practical e-commerce domain modeling, transactional consistency, and the operational workflow behind secondhand inventory.

## Current Features

- Product catalog with category and platform filters.
- Product detail pages with condition-ranked inventory.
- Availability-first display and catalog pagination.
- Guest and authenticated shopping carts.
- Guest cart merge after login.
- Checkout with serialized inventory reservation.
- Concurrent checkout protection for one-of-a-kind items.
- User registration, login, profile management, and order history.
- User Buyback request form with ISBN/JAN lookup.
- Estimated Buyback pricing based on catalog data and declared condition.
- Buyback request history, detail view, validation, and ownership protection.
- Database migrations and large sample catalogs for books, manga, video, and games.

Staff/Admin Buyback review, final pricing, inventory intake, and the complete order lifecycle are planned next.

## Serialized Inventory

MonoMarket treats every physical item as a unique inventory record.

```text
Product
  └── InventoryItem #1 — Rank A — ¥3,200 — AVAILABLE
  └── InventoryItem #2 — Rank B — ¥2,400 — RESERVED
  └── InventoryItem #3 — Rank C — ¥1,500 — SOLD
```

Each `inventory_items` row has its own `instore_code`, condition rank, price, and status. A cart item therefore represents exactly one physical inventory item.

Checkout uses a database lock and refreshes the locked inventory state before reservation, preventing two concurrent requests from purchasing the same item.

## Architecture

MonoMarket is a Spring Boot monolith using Spring MVC and Thymeleaf.

```text
HTTP Request
    │
    ▼
Controller ──► Service ──► Repository ──► PostgreSQL
    │              │
    │              └──► Entity / DTO
    ▼
Thymeleaf Template
    │
    ▼
HTML Response
```

The application follows a layered structure:

- **Controller:** handles HTTP requests, authentication context, validation results, and view models.
- **Service:** owns business rules, transactions, state changes, pricing, and ownership checks.
- **Repository:** handles database queries, relationship fetching, and pessimistic locking.
- **Entity/DTO:** separates persistence models from data prepared for forms and views.
- **Thymeleaf:** renders the storefront, cart, checkout, profile, and Buyback pages on the server.

Catalog data required by views is loaded explicitly so the application can run with Open Session in View disabled without relying on lazy database queries during template rendering.

## Core Domain Model

```text
User
├── Cart
│   └── CartItem ──► InventoryItem ──► Product ──► Category
├── Order
│   └── OrderItem ──► InventoryItem
└── BuybackRequest
    └── BuybackRequestItem ──► Product
```

The catalog `Product` is the shared product identity identified by ISBN/JAN. `InventoryItem` represents a physical sellable unit, while `BuybackRequestItem` references the catalog product submitted by a user.

## Tech Stack

| Area | Technology |
|---|---|
| Runtime | Java 21 |
| Framework | Spring Boot 3.4.1 |
| Web | Spring MVC |
| Server-side UI | Thymeleaf, HTML5, CSS3 |
| Security | Spring Security, form login, BCrypt, CSRF protection |
| Persistence | Spring Data JPA, Hibernate |
| Database | PostgreSQL, JSONB |
| Database migration | Flyway (Currently 12 Versions) |
| Unit and web testing | JUnit 5, Mockito, MockMvc, AssertJ, H2 |
| Database integration testing | Testcontainers with PostgreSQL 18.1 |
| Build and CI | Maven Wrapper, GitHub Actions |

## Reliability Baseline

- Flyway validates and creates the PostgreSQL schema from an empty database.
- PostgreSQL integration tests run through Testcontainers.
- Checkout concurrency coverage verifies that only one request can reserve the same inventory item.
- Catalog relationship loading is tested with Open Session in View disabled.
- GitHub Actions runs Maven verification for repository changes.

The current baseline contains **49 passing tests** with no failures or errors.
