require "test_helper"

class CategoriesTest < ActionDispatch::IntegrationTest
  test "lists categories and links to their collection pages" do
    category = create_test_category(name: "Browse category")

    get categories_url

    assert_response :success
    assert_select "a[href=?]", category_path(category), text: category.name
  end

  test "shows category information and its products" do
    category = create_test_category(name: "Products category")
    product = create_test_product(category: category, name: "Category product")

    get category_url(category)

    assert_response :success
    assert_select "h1", category.name
    assert_select "a[href=?]", product_path(product), text: product.name
  end
end
