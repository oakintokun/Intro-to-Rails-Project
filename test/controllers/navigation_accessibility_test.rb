require "test_helper"

class NavigationAccessibilityTest < ActionDispatch::IntegrationTest
  test "provides an accessible collapsible menu for small screens" do
    get products_url

    assert_response :success
    assert_select "nav[aria-label='Primary']"
    assert_select "button.navbar-toggler[aria-controls='primary-navigation'][aria-expanded='false']"
    assert_select "#primary-navigation.collapse"
    assert_select "#primary-navigation a[href=?]", products_path, text: "Products"
    assert_select "#primary-navigation a[href=?]", categories_path, text: "Categories"
    assert_select "#primary-navigation a[href=?]", brands_path, text: "Brands"
    assert_select "#primary-navigation a[href=?]", about_path, text: "About"
  end
end
