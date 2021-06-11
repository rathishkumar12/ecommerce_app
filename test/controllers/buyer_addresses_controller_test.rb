require "test_helper"

class BuyerAddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @buyer_address = buyer_addresses(:one)
  end

  test "should get index" do
    get buyer_addresses_url
    assert_response :success
  end

  test "should get new" do
    get new_buyer_address_url
    assert_response :success
  end

  test "should create buyer_address" do
    assert_difference('BuyerAddress.count') do
      post buyer_addresses_url, params: { buyer_address: { buyer_id: @buyer_address.buyer_id, lat: @buyer_address.lat, lon: @buyer_address.lon, pincode_id: @buyer_address.pincode_id, street_name: @buyer_address.street_name } }
    end

    assert_redirected_to buyer_address_url(BuyerAddress.last)
  end

  test "should show buyer_address" do
    get buyer_address_url(@buyer_address)
    assert_response :success
  end

  test "should get edit" do
    get edit_buyer_address_url(@buyer_address)
    assert_response :success
  end

  test "should update buyer_address" do
    patch buyer_address_url(@buyer_address), params: { buyer_address: { buyer_id: @buyer_address.buyer_id, lat: @buyer_address.lat, lon: @buyer_address.lon, pincode_id: @buyer_address.pincode_id, street_name: @buyer_address.street_name } }
    assert_redirected_to buyer_address_url(@buyer_address)
  end

  test "should destroy buyer_address" do
    assert_difference('BuyerAddress.count', -1) do
      delete buyer_address_url(@buyer_address)
    end

    assert_redirected_to buyer_addresses_url
  end
end
