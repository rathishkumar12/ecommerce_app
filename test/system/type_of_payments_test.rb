require "application_system_test_case"

class TypeOfPaymentsTest < ApplicationSystemTestCase
  setup do
    @type_of_payment = type_of_payments(:one)
  end

  test "visiting the index" do
    visit type_of_payments_url
    assert_selector "h1", text: "Type Of Payments"
  end

  test "creating a Type of payment" do
    visit type_of_payments_url
    click_on "New Type Of Payment"

    fill_in "Name", with: @type_of_payment.name
    click_on "Create Type of payment"

    assert_text "Type of payment was successfully created"
    click_on "Back"
  end

  test "updating a Type of payment" do
    visit type_of_payments_url
    click_on "Edit", match: :first

    fill_in "Name", with: @type_of_payment.name
    click_on "Update Type of payment"

    assert_text "Type of payment was successfully updated"
    click_on "Back"
  end

  test "destroying a Type of payment" do
    visit type_of_payments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Type of payment was successfully destroyed"
  end
end
