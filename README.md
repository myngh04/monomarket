# MonoMarket - Recommerce Platform for Used Books & Entertainment Devices (B2C & C2B)

MonoMarket is a specialized e-commerce platform for secondhand goods (Recommerce), heavily inspired by the successful operational models of the Japanese recommerce giants.

The project has transitioned from a traditional C2C model to a hybrid **B2C & C2B model**:
1. **B2C (Business-to-Consumer):** The store directly sells brand-new products (self-imported/distributed stock) and verified secondhand products (graded S, A, B, C) collected from users.
2. **C2B (Consumer-to-Business - Buyback Process):** Users can submit buyback requests to sell/liquidate their used items (books, manga, game discs, devices, etc.) to the store. The store inspects, prices, pays the users, and then places the approved items into the store's secondhand inventory.

---

## ⚙️ Serialized Inventory Design

Second-hand e-commerce has a unique characteristic where **each used item is unique (one-of-a-kind)**:
* They are managed via unique identifiers (`instore_code`).
* Two books of the same title can have different prices because one is in 99% new condition (Rank A - high price), while the other might have yellowed pages (Rank C - low price).
* The inventory level is managed by **counting the rows (COUNT)** of available records in the `inventory_items` table instead of storing a static quantity column `stock`.

---

## 🛠️ Tech Stack

* **Backend:** Java 21, Spring Boot 4.1.x, Spring Data JPA
* **Database:** PostgreSQL 18+ (Dynamic attributes optimization via `JSONB` with GIN indexing)
* **Flyway:** Database migration version control (`db/migration/`)
* **Frontend Rendering:** Thymeleaf, HTML5, CSS3 (Vanilla CSS + Google Fonts)
* **i18n:** Real-time multi-language support (Vietnamese / 日本語 / English)
