# Dataset description — Rubric 1.1

The project uses three **separate CSV source files** generated for this educational project. They contain fictional sample information, not verified retail listings.

1. `db/data/categories.csv`: 8 rows, columns `name`, `description`.
2. `db/data/brands.csv`: 8 rows, columns `name`, `country`.
3. `db/data/products.csv`: 240 rows, columns `source_code`, `name`, `description`, `price`, `rating`, `skin_type`, `category_name`, `brand_name`.

The Rails database contains `categories`, `brands`, and `products`. All tables also have Rails-generated primary keys and timestamps. `products` has foreign keys `category_id` and `brand_id`. The seeding script imports categories and brands first, then looks up the referenced records by their names while importing products. Total imported records: **256**.

**Data provenance:** All CSV rows were programmatically generated for this assignment; brands and product names are invented. Prices, ratings, and brand-country values are simulated and should not be represented as real retail facts. Each file is imported independently using Ruby's CSV library. The assignment rubric explicitly counts multiple CSV files as separate data sources; these three CSV files therefore provide three sources for rubric 1.7.

**Mapping note:** The brand `country` values are fictional sample attributes, not verified headquarters or location data. The optional map demonstration places each country at an approximate country-center coordinate configured in `app/controllers/brands_controller.rb`. Since rubric 3.6 requires imported address/GPS location data and disallows adding a random map for credit, this demonstration is not claimed as satisfying that criterion.
