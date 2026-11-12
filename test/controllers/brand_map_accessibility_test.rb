require "test_helper"

class BrandMapAccessibilityTest < ActionDispatch::IntegrationTest
  test "provides keyboard instructions and a linked text alternative" do
    brand = create_test_brand(name: "Accessible map brand", country: "France")

    get brand_map_url

    assert_response :success
    assert_select "#brand-map[role=region][aria-describedby=brand-map-help]"
    assert_select "#brand-map-help.visually-hidden", /arrow keys/
    assert_select "a[href=?]", brand_path(brand), text: brand.name
    assert_includes response.body, "keyboard: true"
  end
end
