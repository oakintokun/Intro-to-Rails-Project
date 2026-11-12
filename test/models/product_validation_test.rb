require "test_helper"

class ProductValidationTest < ActiveSupport::TestCase
  test "requires descriptive fields and associations" do
    product = Product.new

    assert_not product.valid?
    %i[name description skin_type category brand source_code].each do |attribute|
      assert_includes product.errors.attribute_names, attribute
    end
  end

  test "requires a positive price" do
    product = build_product(price: 0)

    assert_not product.valid?
    assert_includes product.errors.attribute_names, :price
  end

  test "allows ratings from zero to five and rejects out-of-range ratings" do
    assert build_product(rating: 0).valid?
    assert build_product(rating: 5).valid?
    assert_not build_product(rating: -0.1).valid?
    assert_not build_product(rating: 5.1).valid?
  end

  test "requires a unique source code" do
    product = create_test_product(source_code: "UNIQUE-SOURCE")
    duplicate = Product.new(
      name: "Another product",
      description: "A different product.",
      price: 12,
      rating: 3,
      skin_type: "All",
      source_code: product.source_code,
      category: product.category,
      brand: product.brand
    )

    assert_not duplicate.valid?
    assert_includes duplicate.errors.attribute_names, :source_code
  end

  private

  def build_product(price: 10, rating: 4)
    Product.new(
      name: "Validation product",
      description: "A product for validation tests.",
      price: price,
      rating: rating,
      skin_type: "All",
      source_code: "TEST-#{SecureRandom.hex(6)}",
      category: create_test_category,
      brand: create_test_brand
    )
  end
end
