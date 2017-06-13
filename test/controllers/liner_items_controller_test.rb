require 'test_helper'

class LinerItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @liner_item = liner_items(:one)
  end

  test "should get index" do
    get liner_items_url
    assert_response :success
  end

  test "should get new" do
    get new_liner_item_url
    assert_response :success
  end

  test "should create liner_item" do
    assert_difference('LinerItem.count') do
      post liner_items_url, params: { product_id: products(:ruby).id }
    end
    follow_redirect!

    assert_select 'h4', 'Your cart'
    assert_select 'td', "Book 1"
    assert_redirected_to liner_item_url(LinerItem.last)
  end

  test "should show liner_item" do
    get liner_item_url(@liner_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_liner_item_url(@liner_item)
    assert_response :success
  end

  test "should update liner_item" do
    patch liner_item_url(@liner_item), params: { liner_item: { product_id: @liner_item.product_id } }
    assert_redirected_to liner_item_url(@liner_item)
  end

  test "should destroy liner_item" do
    assert_difference('LinerItem.count', -1) do
      delete liner_item_url(@liner_item)
    end

    assert_redirected_to liner_items_url
  end
end
