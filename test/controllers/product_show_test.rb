require "test_helper"

class ProductShowTest < ActionDispatch::IntegrationTest
  test "shows product details and links to its associated pages" do
    product = create_test_product(name: "Detailed sample product")

    get product_url(product)

    assert_response :success
    assert_select "h1", product.name
    assert_select "a[href=?]", brand_path(product.brand), text: product.brand.name
    assert_select "a[href=?]", category_path(product.category), text: product.category.name
    assert_select "dd", /All/
    assert_select "dd", /#{product.source_code}/
  end
end
