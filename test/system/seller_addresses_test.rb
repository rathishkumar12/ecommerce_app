require "application_system_test_case"

class SellerAddressesTest < ApplicationSystemTestCase
  setup do
    @seller_address = seller_addresses(:one)
  end

  test "visiting the index" do
    visit seller_addresses_url
    assert_selector "h1", text: "Seller Addresses"
  end

  test "creating a Seller address" do
    visit seller_addresses_url
    click_on "New Seller Address"

    fill_in "Lat", with: @seller_address.lat
    fill_in "Lon", with: @seller_address.lon
    fill_in "Pincode", with: @seller_address.pincode_id
    fill_in "Seller", with: @seller_address.seller_id
    fill_in "Street name", with: @seller_address.street_name
    click_on "Create Seller address"

    assert_text "Seller address was successfully created"
    click_on "Back"
  end

  test "updating a Seller address" do
    visit seller_addresses_url
    click_on "Edit", match: :first

    fill_in "Lat", with: @seller_address.lat
    fill_in "Lon", with: @seller_address.lon
    fill_in "Pincode", with: @seller_address.pincode_id
    fill_in "Seller", with: @seller_address.seller_id
    fill_in "Street name", with: @seller_address.street_name
    click_on "Update Seller address"

    assert_text "Seller address was successfully updated"
    click_on "Back"
  end

  test "destroying a Seller address" do
    visit seller_addresses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Seller address was successfully destroyed"
  end
end
