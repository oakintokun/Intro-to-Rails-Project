class BrandsController < ApplicationController
  COUNTRY_CENTERS = {
    "Canada" => [56.1304, -106.3468],
    "United States" => [39.8283, -98.5795],
    "United Kingdom" => [55.3781, -3.4360],
    "France" => [46.2276, 2.2137],
    "South Korea" => [35.9078, 127.7669],
    "Japan" => [36.2048, 138.2529],
    "Nigeria" => [9.0820, 8.6753]
  }.freeze

  def index
    @brands = Brand.order(:name)
  end

  def map
    @brands_by_country = Brand.order(:country, :name).group_by(&:country)
    @map_locations = []
    @unmapped_countries = []

    @brands_by_country.each do |country, brands|
      coordinates = COUNTRY_CENTERS[country]
      if coordinates
        @map_locations << {
          country: country,
          latitude: coordinates[0],
          longitude: coordinates[1],
          brands: brands.map { |brand| { name: brand.name, path: brand_path(brand) } }
        }
      else
        @unmapped_countries << country
      end
    end
  end

  def show
    @brand = Brand.find(params[:id])
    @products = @brand.products.includes(:category).alphabetical.page(params[:page]).per(12)
  end
end
