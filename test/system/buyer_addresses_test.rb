require "application_system_test_case"

class BuyerAddressesTest < ApplicationSystemTestCase
  setup do
    @buyer_address = buyer_addresses(:one)
  end

  test "visiting the index" do
    visit buyer_addresses_url
    assert_selector "h1", text: "Buyer Addresses"
  end

  test "creating a Buyer address" do
    visit buyer_addresses_url
    click_on "New Buyer Address"

    fill_in "Buyer", with: @buyer_address.buyer_id
    fill_in "Lat", with: @buyer_address.lat
    fill_in "Lon", with: @buyer_address.lon
    fill_in "Pincode", with: @buyer_address.pincode_id
    fill_in "Street name", with: @buyer_address.street_name
    click_on "Create Buyer address"

    assert_text "Buyer address was successfully created"
    click_on "Back"
  end

  test "updating a Buyer address" do
    visit buyer_addresses_url
    click_on "Edit", match: :first

    fill_in "Buyer", with: @buyer_address.buyer_id
    fill_in "Lat", with: @buyer_address.lat
    fill_in "Lon", with: @buyer_address.lon
    fill_in "Pincode", with: @buyer_address.pincode_id
    fill_in "Street name", with: @buyer_address.street_name
    click_on "Update Buyer address"

    assert_text "Buyer address was successfully updated"
    click_on "Back"
  end

  test "destroying a Buyer address" do
    visit buyer_addresses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Buyer address was successfully destroyed"
  end
end
