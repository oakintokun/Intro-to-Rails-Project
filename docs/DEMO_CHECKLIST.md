# Instructor demo checklist

**Show these features and ask your instructor to mark them:**

- [ ] 1.1 Dataset description — open `docs/DATASET_DESCRIPTION.md` and About page.
- [ ] 1.2 ERD — open `docs/ERD.md`.
- [ ] 1.3 Three database tables — run `bin/rails db:migrate:status`, `bin/rails runner "puts [Category.count, Brand.count, Product.count].inspect"`.
- [ ] 1.4 and 1.5 Associations — show models and linked brand/category pages.
- [ ] 1.6 Validations — show model validations and test an invalid record in console.
- [ ] 1.7 Seed sources — show `db/seeds.rb`, the three CSV files, and 256 records.
- [ ] 2.1 About page — click About.
- [ ] 2.2 Menu — click Products, Categories, Brands and About.
- [ ] 3.1 Collection navigation — show product listing.
- [ ] 3.2 Member pages — click a product and inspect attributes.
- [ ] 3.3 Associated data — click brand/category links from a product.
- [ ] 3.4 Hierarchical navigation — go category → product → category.
- [ ] 3.5 Pagination — click page 2 on products.
- [ ] 3.6 Mapping — not claimed for rubric credit: the project has no sourced address/GPS location data. The map is a fictional-data demonstration only.
- [ ] 4.1 Simple search — search `Glow`.
- [ ] 4.2 Hierarchical search — select a category and search.
- [ ] 5.1 HTML validity — local structural checks passed; also validate representative generated pages with the W3C Nu HTML Checker if required, and fix any reported errors before demo.
- [ ] 5.2 ERB conditional — show `if @products.any?` in index.
- [ ] 5.3 Bootstrap grid — show `row` and `col-*` classes in views.
- [ ] Automated tests — run `ruby bin/rails test` (Rails prepares the test database automatically).
- [x] 6.1 GitHub — repository created and pushed.
- [x] 6.2 20 commits — 20 commits are present on `main`.
- [ ] GitHub Actions — push the `config/storage.yml` fix and verify the Rails tests workflow passes.

The map is an approximate visualization of fictional country fields, not verified locations; do not claim it fulfills rubric 3.6. Final grading and conditional criteria are up to the instructor.
