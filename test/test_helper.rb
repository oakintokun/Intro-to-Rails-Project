ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "securerandom"

module TestData
  def create_test_category(name: "Test category", description: "A test category.")
    Category.create!(name: "#{name} #{SecureRandom.hex(4)}", description: description)
  end

  def create_test_brand(name: "Test brand", country: "Testland")
    Brand.create!(name: "#{name} #{SecureRandom.hex(4)}", country: country)
  end

  def create_test_product(
    category: create_test_category,
    brand: create_test_brand,
    name: "Test product",
    description: "A test product description.",
    price: 10.00,
    rating: 4.0,
    skin_type: "All",
    source_code: "TEST-#{SecureRandom.hex(6)}"
  )
    Product.create!(
      category: category,
      brand: brand,
      name: name,
      description: description,
      price: price,
      rating: rating,
      skin_type: skin_type,
      source_code: source_code
    )
  end
end

class ActiveSupport::TestCase
  include TestData
end

class ActionDispatch::IntegrationTest
  include TestData
end
