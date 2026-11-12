require "test_helper"
require "csv"

class SeedDataTest < ActiveSupport::TestCase
  test "imports each CSV source and links every product" do
    Rails.application.load_seed

    categories = CSV.read(Rails.root.join("db/data/categories.csv"), headers: true)
    brands = CSV.read(Rails.root.join("db/data/brands.csv"), headers: true)
    products = CSV.read(Rails.root.join("db/data/products.csv"), headers: true)

    assert_equal categories.size, Category.count
    assert_equal brands.size, Brand.count
    assert_equal products.size, Product.count
    assert_equal Product.count, Product.joins(:category, :brand).count
  end

  test "can be loaded repeatedly without duplicate records" do
    Rails.application.load_seed
    initial_counts = [Category.count, Brand.count, Product.count]

    Rails.application.load_seed

    assert_equal initial_counts, [Category.count, Brand.count, Product.count]
  end
end
