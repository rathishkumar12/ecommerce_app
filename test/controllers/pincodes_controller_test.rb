require "test_helper"

class PincodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pincode = pincodes(:one)
  end

  test "should get index" do
    get pincodes_url
    assert_response :success
  end

  test "should get new" do
    get new_pincode_url
    assert_response :success
  end

  test "should create pincode" do
    assert_difference('Pincode.count') do
      post pincodes_url, params: { pincode: { area: @pincode.area, city: @pincode.city, pincode: @pincode.pincode } }
    end

    assert_redirected_to pincode_url(Pincode.last)
  end

  test "should show pincode" do
    get pincode_url(@pincode)
    assert_response :success
  end

  test "should get edit" do
    get edit_pincode_url(@pincode)
    assert_response :success
  end

  test "should update pincode" do
    patch pincode_url(@pincode), params: { pincode: { area: @pincode.area, city: @pincode.city, pincode: @pincode.pincode } }
    assert_redirected_to pincode_url(@pincode)
  end

  test "should destroy pincode" do
    assert_difference('Pincode.count', -1) do
      delete pincode_url(@pincode)
    end

    assert_redirected_to pincodes_url
  end
end
