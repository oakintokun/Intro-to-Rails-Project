require "test_helper"
require "json"
require "nokogiri"

class BrandMapUnmappedTest < ActionDispatch::IntegrationTest
  test "reports countries without coordinates instead of silently omitting them" do
    brand = create_test_brand(name: "Unmapped sample", country: "Atlantis")

    get brand_map_url

    assert_response :success
    assert_select ".alert-warning", /Atlantis/
    assert_select "a[href=?]", brand_path(brand), text: brand.name
    map_data = JSON.parse(Nokogiri::HTML(response.body).at_css("#brand-map")["data-brand-locations"])
    assert_not map_data.any? { |location| location["country"] == "Atlantis" }
  end
end
