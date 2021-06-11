require "test_helper"

class SellerAddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @seller_address = seller_addresses(:one)
  end

  test "should get index" do
    get seller_addresses_url
    assert_response :success
  end

  test "should get new" do
    get new_seller_address_url
    assert_response :success
  end

  test "should create seller_address" do
    assert_difference('SellerAddress.count') do
      post seller_addresses_url, params: { seller_address: { lat: @seller_address.lat, lon: @seller_address.lon, pincode_id: @seller_address.pincode_id, seller_id: @seller_address.seller_id, street_name: @seller_address.street_name } }
    end

    assert_redirected_to seller_address_url(SellerAddress.last)
  end

  test "should show seller_address" do
    get seller_address_url(@seller_address)
    assert_response :success
  end

  test "should get edit" do
    get edit_seller_address_url(@seller_address)
    assert_response :success
  end

  test "should update seller_address" do
    patch seller_address_url(@seller_address), params: { seller_address: { lat: @seller_address.lat, lon: @seller_address.lon, pincode_id: @seller_address.pincode_id, seller_id: @seller_address.seller_id, street_name: @seller_address.street_name } }
    assert_redirected_to seller_address_url(@seller_address)
  end

  test "should destroy seller_address" do
    assert_difference('SellerAddress.count', -1) do
      delete seller_address_url(@seller_address)
    end

    assert_redirected_to seller_addresses_url
  end
end
