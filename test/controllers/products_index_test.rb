require "test_helper"

class ProductsIndexTest < ActionDispatch::IntegrationTest
  test "lists products and exposes the search and filter controls" do
    product = create_test_product(name: "Index test product")

    get products_url

    assert_response :success
    assert_select "h1", "Find your next beauty favourite."
    assert_select "a[href=?]", product_path(product), text: product.name
    assert_select "input[name=q]"
    assert_select "select[name=category_id]"
    assert_select "select[name=brand_id]"
  end

  test "shows a clear message when no products match" do
    get products_url, params: { q: "no matching test product" }

    assert_response :success
    assert_select ".alert", /No products matched your search/
    assert_select "a[href=?]", products_path, text: "Clear filters"
  end
end
