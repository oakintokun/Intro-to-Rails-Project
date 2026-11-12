# Beauty Product Explorer — Rails Intro Project

A Ruby on Rails web application for browsing a **fictional** beauty product dataset. Built for the Rails Intro Project rubric.

## Windows setup (VS Code PowerShell)

1. Extract the ZIP and open the **Beauty_Product_Explorer** folder in VS Code.
2. Confirm Ruby and Bundler are installed: `ruby -v` and `bundle -v`.
3. Run `bundle install` (requires internet access).
4. Run `ruby bin/rails db:prepare` to create the database and run migrations/seeds. If records are missing, run `ruby bin/rails db:seed`.
5. Start the app with `ruby bin/rails server`.
6. Open http://127.0.0.1:3000/ in your browser.

The ZIP does not include downloaded gems or a prebuilt database. Rails and gems must be installed on your computer. The app has been smoke-tested with Ruby 3.4.10 and Rails 8.1.4.1 on Linux, including database setup, repeatable seeding, search/filtering, pagination, the main pages, and the brand-country map. Windows-specific setup has not been tested; if you encounter a startup error, share the terminal output for troubleshooting.

## Project data

- 8 fictional categories
- 8 fictional brands
- 240 fictional products
- 256 database rows total after seeding
- 3 local CSV input files in `db/data/`

The seed script is idempotent: running it again updates existing records rather than creating duplicates.

## Tests

Run the Rails test suite with:

```powershell
ruby bin/rails test
```

Rails prepares the test database automatically. Tests cover model validation and associations, CSV seed imports, product search and filtering, wildcard escaping, pagination, collection and member pages, map behavior and accessibility, and responsive navigation. A GitHub Actions workflow runs the test suite for pushes and pull requests.

The brand map uses approximate country-center markers for fictional sample data. Leaflet and OpenStreetMap provide the map display and tiles, so an internet connection is needed to view the map.

## Rubric evidence

- `docs/DATASET_DESCRIPTION.md` — 1.1
- `docs/ERD.md` — 1.2
- `docs/DEMO_CHECKLIST.md` — presentation checklist
- Models and migrations — 1.3–1.6
- `db/seeds.rb` and `db/data/*.csv` — 1.7
- Views/controllers — sections 2–5
- `/brands/map` — 3.6, approximate map of sample brand countries
- `test/` — automated checks for the app's models and pages

## GitHub

Initialize your own Git repository with `git init`, then use the ordered, path-specific add/commit commands prepared for this project. Avoid `git add .` before those steps because it stages all pending work into one commit. Do **not** fabricate a 20-commit history; each commit should capture a real project or testing improvement.

```powershell
git init
```

Create an empty repository on GitHub and follow its instructions for connecting `origin` and pushing your branch.
