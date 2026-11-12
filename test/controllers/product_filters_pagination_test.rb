require "test_helper"

class ProductFiltersPaginationTest < ActionDispatch::IntegrationTest
  test "combines search, category, and brand filters" do
    category = create_test_category
    brand = create_test_brand
    match = create_test_product(
      category: category,
      brand: brand,
      name: "Filtered serum"
    )
    create_test_product(name: "Filtered serum outside category")

    get products_url, params: {
      q: "Filtered serum",
      category_id: category.id,
      brand_id: brand.id
    }

    assert_response :success
    assert_select "a[href=?]", product_path(match), text: match.name
    assert_select "h2", /1 results/
  end

  test "paginates results and retains filters in page links" do
    category = create_test_category
    brand = create_test_brand
    products = 13.times.map do |index|
      create_test_product(
        category: category,
        brand: brand,
        name: "Pageable item #{index}"
      )
    end

    get products_url, params: {
      q: "Pageable item",
      category_id: category.id,
      brand_id: brand.id,
      page: 2
    }

    assert_response :success
    assert_select "a[href=?]", product_path(products[9]), text: products[9].name
    assert_select "a[href*=category_id]", minimum: 1
    assert_select "a[href*=brand_id]", minimum: 1
    assert_select "input[name=q][value='Pageable item']"
    assert_select "select[name=category_id] option[selected][value='#{category.id}']"
    assert_select "select[name=brand_id] option[selected][value='#{brand.id}']"
  end
end
