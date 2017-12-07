require 'spec_helper'

describe "When user visits /conditions/:id path" do
  before :each do
    c = Condition.create(date: "2013-09-06",
      max_temperature_f: 20.0,
      mean_temperature_f: 30.0,
      min_temperature_f: 10.0,
      mean_humidity: 35.0,
      mean_visibility_miles: 10,
      mean_wind_speed_mph: 55,
      precipitation_inches: 4)

      visit "/conditions/#{c.id}"
  end

  it "sees specific condition by ID and associated attributes" do
    expect(page.status_code).to eq(200)
    expect(page).to have_content("9/6/2013")
    expect(page).to have_content(35.0)
    expect(page).to have_content(4)
    expect(page).to have_content(55)
    expect(page).to have_content(10)
    expect(page).to have_content(30)
  end
end
