require "test_helper"

class BuyersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @buyer = buyers(:one)
  end

  test "should get index" do
    get buyers_url
    assert_response :success
  end

  test "should get new" do
    get new_buyer_url
    assert_response :success
  end

  test "should create buyer" do
    assert_difference('Buyer.count') do
      post buyers_url, params: { buyer: { buyer_name: @buyer.buyer_name, email: @buyer.email, is_active: @buyer.is_active, password: @buyer.password, phone_number: @buyer.phone_number } }
    end

    assert_redirected_to buyer_url(Buyer.last)
  end

  test "should show buyer" do
    get buyer_url(@buyer)
    assert_response :success
  end

  test "should get edit" do
    get edit_buyer_url(@buyer)
    assert_response :success
  end

  test "should update buyer" do
    patch buyer_url(@buyer), params: { buyer: { buyer_name: @buyer.buyer_name, email: @buyer.email, is_active: @buyer.is_active, password: @buyer.password, phone_number: @buyer.phone_number } }
    assert_redirected_to buyer_url(@buyer)
  end

  test "should destroy buyer" do
    assert_difference('Buyer.count', -1) do
      delete buyer_url(@buyer)
    end

    assert_redirected_to buyers_url
  end
end
