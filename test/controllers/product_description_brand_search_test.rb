require "test_helper"

class ProductDescriptionBrandSearchTest < ActionDispatch::IntegrationTest
  test "searches product descriptions" do
    product = create_test_product(
      name: "Neutral moisturizer",
      description: "Contains a rarephrase for searching."
    )

    get products_url, params: { q: "rarephrase" }

    assert_response :success
    assert_select "a[href=?]", product_path(product), text: product.name
  end

  test "searches associated brand names" do
    brand = create_test_brand(name: "Searchable label")
    product = create_test_product(brand: brand, name: "Unrelated moisturizer")

    get products_url, params: { q: "Searchable label" }

    assert_response :success
    assert_select "a[href=?]", product_path(product), text: product.name
  end
end
