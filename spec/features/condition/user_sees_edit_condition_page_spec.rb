require 'spec_helper'

describe "When user visits /conditions/:id/edit path" do
  before(:each) do
    weather = Condition.create(date: "12/5/2017",
                max_temperature_f: 70.0,
                mean_temperature_f: 65.0,
                min_temperature_f: 63.0,
                mean_humidity: 50.0,
                mean_visibility_miles: 3,
                mean_wind_speed_mph: 5,
                precipitation_inches: 1)
    visit '/conditions/1/edit'
  end

  it "sees an Edit Condition page with appropriate header and links" do
    expect(page).to have_content "Edit Condition"
    expect(page).to have_link("Home", :href=>'/')
    expect(page).to have_link("Trips", :href=>'/trips')
    expect(page).to have_link("Stations", :href=>'/stations')
    expect(page).to have_link("Station Dashboard", :href=>'/stations-dashboard')
    expect(page).to have_link("Trip Dashboard", :href=>'/trips-dashboard')
  end

  it "sees a table with column field describing each input field" do
    expect(page).to have_content "Max Temp(F):"
    expect(page).to have_content "Min Temp(F):"
    expect(page).to have_content "Mean Temp(F):"
    expect(page).to have_content "Mean Humidity:"
    expect(page).to have_content "Mean Visibility(miles):"
    expect(page).to have_content "Mean Wind Speed(mph):"
    expect(page).to have_content "Precipitation(inches):"
  end

  it "sees a Submit button that when clicked redirects user to that condition's show page" do
    fill_in "condition[max_temperature_f]", :with => 86.0
    fill_in "condition[mean_humidity]", :with => 23.0
    fill_in "condition[precipitation_inches]", :with => 5

    click_button("submit-button")

    expect(current_path).to eq "/conditions/1"

    expect(page).to have_content 86.0
    expect(page).to have_content 23.0
    expect(page).to have_content 5
  end
end
