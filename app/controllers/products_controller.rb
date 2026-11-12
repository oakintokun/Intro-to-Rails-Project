class ProductsController < ApplicationController
  def index
    @categories = Category.order(:name)
    @brands = Brand.order(:name)
    @products = Product.includes(:category, :brand).alphabetical
    # Search product name, description, or brand name.
    if params[:q].present?
      term = "%#{Product.sanitize_sql_like(params[:q].strip)}%"
      @products = @products.joins(:brand).where("products.name LIKE :q ESCAPE '\\' OR products.description LIKE :q ESCAPE '\\' OR brands.name LIKE :q ESCAPE '\\'", q: term)
    end
    @products = @products.where(category_id: params[:category_id]) if params[:category_id].present?
    @products = @products.where(brand_id: params[:brand_id]) if params[:brand_id].present?
    @products = @products.page(params[:page]).per(12)
  end

  def show
    @product = Product.includes(:brand, :category).find(params[:id])
    @related = @product.category.products.where.not(id: @product.id).limit(4)
  end
end
