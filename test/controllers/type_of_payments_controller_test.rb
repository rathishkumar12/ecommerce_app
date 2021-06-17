require "test_helper"

class TypeOfPaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_of_payment = type_of_payments(:one)
  end

  test "should get index" do
    get type_of_payments_url
    assert_response :success
  end

  test "should get new" do
    get new_type_of_payment_url
    assert_response :success
  end

  test "should create type_of_payment" do
    assert_difference('TypeOfPayment.count') do
      post type_of_payments_url, params: { type_of_payment: { name: @type_of_payment.name } }
    end

    assert_redirected_to type_of_payment_url(TypeOfPayment.last)
  end

  test "should show type_of_payment" do
    get type_of_payment_url(@type_of_payment)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_of_payment_url(@type_of_payment)
    assert_response :success
  end

  test "should update type_of_payment" do
    patch type_of_payment_url(@type_of_payment), params: { type_of_payment: { name: @type_of_payment.name } }
    assert_redirected_to type_of_payment_url(@type_of_payment)
  end

  test "should destroy type_of_payment" do
    assert_difference('TypeOfPayment.count', -1) do
      delete type_of_payment_url(@type_of_payment)
    end

    assert_redirected_to type_of_payments_url
  end
end
