require "test_helper"

class ProductNameSearchTest < ActionDispatch::IntegrationTest
  test "finds a product by a partial name" do
    product = create_test_product(name: "Searchable cleanser")

    get products_url, params: { q: "Searchable" }

    assert_response :success
    assert_select "a[href=?]", product_path(product), text: product.name
  end

  test "does not match wildcard characters literally as SQL wildcards" do
    wildcard_product = create_test_product(name: "100% pure lotion")
    other_product = create_test_product(name: "100X pure lotion")

    get products_url, params: { q: "%" }

    assert_response :success
    assert_select "a[href=?]", product_path(wildcard_product), text: wildcard_product.name
    assert_select "a[href=?]", product_path(other_product), count: 0
  end
end
