# Beauty Product Explorer

A Ruby on Rails application for browsing an educational beauty-product dataset. The application, seed data, and automated tests are implemented for the Rails Intro Project.

## Run the application

Requirements: Ruby 3.4 or newer, Bundler, and internet access to install gems and load Bootstrap/map assets.

```powershell
bundle install
ruby bin/rails db:prepare
ruby bin/rails server
```

Open http://127.0.0.1:3000/. `db:prepare` creates the SQLite database, applies migrations, and imports the seed data. Re-running the seed is safe.

## Dataset and database

The project has three separate CSV source files in `db/data/`:

| Source file | Rows | Fields |
|---|---:|---|
| `categories.csv` | 8 | `name`, `description` |
| `brands.csv` | 8 | `name`, `country` |
| `products.csv` | 240 | `source_code`, `name`, `description`, `price`, `rating`, `skin_type`, `category_name`, `brand_name` |

The rubric explicitly counts multiple CSV files as separate data sources. All 256 rows are fictional educational sample data generated for this project; product names, brands, prices, ratings, and brand-country values are not verified real-world information.

The database has three models/tables: `Category`, `Brand`, and `Product`. A category has many products, a brand has many products, and each product belongs to one category and one brand. The product CSV links to the category and brand CSVs through their names; `db/seeds.rb` resolves these to foreign keys. See [the dataset description](docs/DATASET_DESCRIPTION.md) and [the ERD](docs/ERD.md).

## Application features

- Product, category, and brand collection and detail pages
- Product search across name, description, and brand, with category and brand filters
- Pagination and navigation between products and their associated category and brand pages
- An About page and responsive Bootstrap navigation
- A brand-country map demonstration and text list

**Mapping rubric note:** the country map uses approximate country centers for fictional sample values. The assignment's mapping criterion (3.6) requires imported location data such as addresses or GPS coordinates and says not to add a random map for credit. This demonstration map is therefore **not claimed as satisfying rubric 3.6**. To claim those marks, replace or augment the sample data with appropriately sourced, real location data and document its provenance.

## Tests and GitHub Actions

Run the Rails tests with:

```powershell
ruby bin/rails test
```

The suite covers validations, associations, seed imports, search, filters, pagination, pages, the map, and navigation. The initial GitHub Actions runs exposed a missing Active Storage configuration and a product-list test that assumed the database was empty. Both issues have been fixed locally; the full suite passes with CI eager loading enabled. Push these latest fixes and confirm the next GitHub Actions run turns green before treating the remote CI check as passed.

## Rubric evidence and remaining checks

- **1.1–1.2:** [Dataset description](docs/DATASET_DESCRIPTION.md) and [ERD](docs/ERD.md).
- **1.3–1.6:** Three models/tables, two one-to-many associations, and model validations.
- **1.7:** Three separate CSV files and 256 total seeded rows; the rubric says multiple CSVs count as separate data sources.
- **2.1–2.2:** About page and site-wide responsive navigation.
- **3.1–3.5:** Collection/detail pages, associated and hierarchical navigation, and pagination.
- **3.6:** Not claimed; the synthetic dataset has no sourced address/GPS location data.
- **4.1–4.2:** Text search and category/brand filters.
- **5.2–5.3:** ERB conditionals and Bootstrap grid layouts.
- **5.1:** Local structural HTML checks passed for representative rendered pages. A separate W3C Nu HTML Checker run has not yet been recorded; complete it before submission if your instructor requires that specific checker.
- **6.1–6.2:** [GitHub repository](https://github.com/oakintokun/Intro-to-Rails-Project) has at least 20 commits on `main`. Commit and push any pending fixes, then verify the latest CI run.

Use the [demo checklist](docs/DEMO_CHECKLIST.md) when presenting the application. Final grading and the applicability of conditional criteria are determined by the instructor.
