require "test_helper"
require "csv"

class BrandMapCoordinatesTest < ActionDispatch::IntegrationTest
  test "defines approximate coordinates for all sample countries" do
    expected_countries = CSV.foreach(Rails.root.join("db/data/brands.csv"), headers: true)
      .map { |row| row.fetch("country") }.uniq

    assert_equal expected_countries.sort, BrandsController::COUNTRY_CENTERS.keys.sort
    BrandsController::COUNTRY_CENTERS.each_value do |latitude, longitude|
      assert_includes(-90..90, latitude)
      assert_includes(-180..180, longitude)
    end
  end
end
