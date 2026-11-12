require "test_helper"

class BrandValidationTest < ActiveSupport::TestCase
  test "requires a name and country" do
    brand = Brand.new

    assert_not brand.valid?
    assert_includes brand.errors.attribute_names, :name
    assert_includes brand.errors.attribute_names, :country
  end

  test "requires a unique name" do
    brand = create_test_brand(name: "Unique brand")
    duplicate = Brand.new(name: brand.name, country: "Testland")

    assert_not duplicate.valid?
    assert_includes duplicate.errors.attribute_names, :name
  end
end
