require "application_system_test_case"

class ForecastsTest < ApplicationSystemTestCase
  setup do
    @forecast = forecasts(:one)
  end

  test "visiting the index" do
    visit forecasts_url
    assert_selector "h1", text: "Forecasts"
  end

  test "creating a Forecast" do
    visit forecasts_url
    click_on "New Forecast"

    fill_in "Lat", with: @forecast.lat
    fill_in "Long", with: @forecast.long
    fill_in "Precip", with: @forecast.precip
    fill_in "Snow", with: @forecast.snow
    fill_in "Temp", with: @forecast.temp
    fill_in "Timestamp utc", with: @forecast.timestamp_utc
    click_on "Create Forecast"

    assert_text "Forecast was successfully created"
    click_on "Back"
  end

  test "updating a Forecast" do
    visit forecasts_url
    click_on "Edit", match: :first

    fill_in "Lat", with: @forecast.lat
    fill_in "Long", with: @forecast.long
    fill_in "Precip", with: @forecast.precip
    fill_in "Snow", with: @forecast.snow
    fill_in "Temp", with: @forecast.temp
    fill_in "Timestamp utc", with: @forecast.timestamp_utc
    click_on "Update Forecast"

    assert_text "Forecast was successfully updated"
    click_on "Back"
  end

  test "destroying a Forecast" do
    visit forecasts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Forecast was successfully destroyed"
  end
end
