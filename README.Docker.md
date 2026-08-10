### Run MonoMarket with Docker

You need Docker Desktop running before starting the stack.

Create your local environment file from the committed template:

```powershell
Copy-Item .env.example .env
```

Open `.env` and set `POSTGRES_PASSWORD` to a local password. Do not commit
this file.

Build the MonoMarket image and start the application and PostgreSQL:

```powershell
docker compose up --build -d
```

The application is available at http://localhost:8081. PostgreSQL is exposed
to the host at `localhost:5433`; MonoMarket connects to it internally at
`db:5432`.

View the application logs:

```powershell
docker compose logs -f server
```

Stop the containers while keeping the Docker database volume:

```powershell
docker compose down
```

Run `docker compose down -v` only when you intentionally want to delete the
Docker PostgreSQL data and let Flyway recreate it on the next start.
