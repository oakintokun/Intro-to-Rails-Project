require "test_helper"
require "json"
require "nokogiri"

class BrandMapMarkersTest < ActionDispatch::IntegrationTest
  test "includes country markers and links each brand to its detail page" do
    brand = create_test_brand(name: "Map marker brand", country: "Japan")

    get brand_map_url

    assert_response :success
    map_data = JSON.parse(Nokogiri::HTML(response.body).at_css("#brand-map")["data-brand-locations"])
    location = map_data.find { |item| item["country"] == "Japan" }

    assert location
    assert_equal BrandsController::COUNTRY_CENTERS.fetch("Japan"), [location["latitude"], location["longitude"]]
    assert_includes location["brands"], { "name" => brand.name, "path" => brand_path(brand) }
    assert_select "a[href=?]", brand_path(brand), text: brand.name
  end
end
