require "application_system_test_case"

class PropertiesTest < ApplicationSystemTestCase
  setup do
    @property = properties(:one)
  end

  test "visiting the index" do
    visit properties_url
    assert_selector "h1", text: "Properties"
  end

  test "creating a Property" do
    visit properties_url
    click_on "New Property"

    fill_in "Address", with: @property.address
    fill_in "Bathrooms", with: @property.bathrooms
    fill_in "Bedrooms", with: @property.bedrooms
    fill_in "Caption", with: @property.caption
    fill_in "Comments count", with: @property.comments_count
    fill_in "Image", with: @property.image
    fill_in "Mortgage", with: @property.mortgage
    fill_in "Owner", with: @property.owner_id
    fill_in "Rent", with: @property.rent
    fill_in "Tenant name", with: @property.tenant_name
    fill_in "Tenant phone", with: @property.tenant_phone
    click_on "Create Property"

    assert_text "Property was successfully created"
    click_on "Back"
  end

  test "updating a Property" do
    visit properties_url
    click_on "Edit", match: :first

    fill_in "Address", with: @property.address
    fill_in "Bathrooms", with: @property.bathrooms
    fill_in "Bedrooms", with: @property.bedrooms
    fill_in "Caption", with: @property.caption
    fill_in "Comments count", with: @property.comments_count
    fill_in "Image", with: @property.image
    fill_in "Mortgage", with: @property.mortgage
    fill_in "Owner", with: @property.owner_id
    fill_in "Rent", with: @property.rent
    fill_in "Tenant name", with: @property.tenant_name
    fill_in "Tenant phone", with: @property.tenant_phone
    click_on "Update Property"

    assert_text "Property was successfully updated"
    click_on "Back"
  end

  test "destroying a Property" do
    visit properties_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Property was successfully destroyed"
  end
end
