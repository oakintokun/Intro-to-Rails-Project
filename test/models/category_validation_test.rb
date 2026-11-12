require "test_helper"

class CategoryValidationTest < ActiveSupport::TestCase
  test "requires a name and description" do
    category = Category.new

    assert_not category.valid?
    assert_includes category.errors.attribute_names, :name
    assert_includes category.errors.attribute_names, :description
  end

  test "requires a unique name" do
    category = create_test_category(name: "Unique category")
    duplicate = Category.new(name: category.name, description: "Another description.")

    assert_not duplicate.valid?
    assert_includes duplicate.errors.attribute_names, :name
  end

  test "limits names to 80 characters" do
    category = Category.new(name: "a" * 81, description: "A description.")

    assert_not category.valid?
    assert_includes category.errors.attribute_names, :name
  end
end
