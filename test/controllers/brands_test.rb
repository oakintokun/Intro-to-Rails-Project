require "test_helper"

class BrandsTest < ActionDispatch::IntegrationTest
  test "lists brands and links to the country map" do
    brand = create_test_brand(name: "Browse brand")

    get brands_url

    assert_response :success
    assert_select "a[href=?]", brand_path(brand), text: brand.name
    assert_select "a[href=?]", brand_map_path, text: "View country map"
  end

  test "shows brand information and its products" do
    brand = create_test_brand(name: "Products brand")
    product = create_test_product(brand: brand, name: "Brand product")

    get brand_url(brand)

    assert_response :success
    assert_select "h1", brand.name
    assert_select "a[href=?]", product_path(product), text: product.name
  end
end
