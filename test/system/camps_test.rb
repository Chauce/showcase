require "application_system_test_case"

class CampsTest < ApplicationSystemTestCase
  setup do
    @camp = camps(:one)
  end

  test "visiting the index" do
    visit camps_url
    assert_selector "h1", text: "Camps"
  end

  test "creating a Camp" do
    visit camps_url
    click_on "New Camp"

    fill_in "Latlong", with: @camp.latLong
    fill_in "Latitude", with: @camp.latitude
    fill_in "Longitude", with: @camp.longitude
    fill_in "Name", with: @camp.name
    fill_in "Weatheroverview", with: @camp.weatheroverview
    click_on "Create Camp"

    assert_text "Camp was successfully created"
    click_on "Back"
  end

  test "updating a Camp" do
    visit camps_url
    click_on "Edit", match: :first

    fill_in "Latlong", with: @camp.latLong
    fill_in "Latitude", with: @camp.latitude
    fill_in "Longitude", with: @camp.longitude
    fill_in "Name", with: @camp.name
    fill_in "Weatheroverview", with: @camp.weatheroverview
    click_on "Update Camp"

    assert_text "Camp was successfully updated"
    click_on "Back"
  end

  test "destroying a Camp" do
    visit camps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Camp was successfully destroyed"
  end
end
