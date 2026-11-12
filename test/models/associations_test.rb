require "test_helper"

class AssociationsTest < ActiveSupport::TestCase
  test "a product belongs to a category and a brand" do
    product = create_test_product

    assert_equal product, product.category.products.find(product.id)
    assert_equal product, product.brand.products.find(product.id)
  end

  test "a category with products cannot be destroyed" do
    category = create_test_category
    create_test_product(category: category)

    assert_not category.destroy
    assert category.persisted?
    assert category.errors.any?
  end

  test "a brand with products cannot be destroyed" do
    brand = create_test_brand
    create_test_product(brand: brand)

    assert_not brand.destroy
    assert brand.persisted?
    assert brand.errors.any?
  end
end
