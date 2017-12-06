require 'spec_helper'

describe "When user visits /weather-dashboard path" do
  before(:each) do
    visit '/weather-dashboard'
  end

  it "sees header with welcome message and appropriate links" do
    expect(page).to have_content "Weather Dashboard"
    expect(page).to have_link "Home", href="/"
    expect(page).to have_link "Weather Index", href ="/conditions"
    expect(page).to have_link "Stations", href='/stations'
    expect(page).to have_link "Trips", href='/trips'
  end

  it "sees data tables with appropriate labels for fields" do
    expect(page).to have_content "Number of trips based on temperature"
    expect(page).to have_content "Number of trips based on precipitation"
  end
end
