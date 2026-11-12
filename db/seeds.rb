require "csv"
# Import three CSV source files and link products to their category and brand.
base = Rails.root.join("db", "data")
CSV.foreach(base.join("categories.csv"), headers: true) do |row|
  category = Category.find_or_initialize_by(name: row.fetch("name"))
  category.description = row.fetch("description")
  category.save!
end
CSV.foreach(base.join("brands.csv"), headers: true) do |row|
  brand = Brand.find_or_initialize_by(name: row.fetch("name"))
  brand.country = row.fetch("country")
  brand.save!
end
CSV.foreach(base.join("products.csv"), headers: true) do |row|
  product = Product.find_or_initialize_by(source_code: row.fetch("source_code"))
  product.assign_attributes(
    name: row.fetch("name"), description: row.fetch("description"),
    price: row.fetch("price"), rating: row.fetch("rating"),
    skin_type: row.fetch("skin_type"),
    category: Category.find_by!(name: row.fetch("category_name")),
    brand: Brand.find_by!(name: row.fetch("brand_name"))
  )
  product.save!
end
puts "Imported #{Category.count} categories, #{Brand.count} brands, and #{Product.count} products (#{Category.count + Brand.count + Product.count} rows total)."
