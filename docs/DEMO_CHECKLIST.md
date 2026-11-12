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
- [ ] 3.6 Mapping — open Brands → View country map; explain that markers are approximate country centers for fictional sample data.
- [ ] 4.1 Simple search — search `Glow`.
- [ ] 4.2 Hierarchical search — select a category and search.
- [ ] 5.1 HTML validity — validate generated HTML using W3C Nu Validator; fix any issues.
- [ ] 5.2 ERB conditional — show `if @products.any?` in index.
- [ ] 5.3 Bootstrap grid — show `row` and `col-*` classes in views.
- [ ] Automated tests — run `ruby bin/rails test` (Rails prepares the test database automatically).
- [ ] 6.1 GitHub — create your own repo and push commits.
- [ ] 6.2 20 commits — make 20 authentic, meaningful commits as you develop and improve the project.

**Git requirements are not completed by this ZIP.** Create your own repository, push it to GitHub, and make your own meaningful commits. Mapping is an approximate visualization of the sample brands' country fields, not verified business locations. Final grading is up to the instructor.
