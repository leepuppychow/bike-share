require 'spec_helper'

describe "When user visits /weather-dashboard path" do
  before(:each) do
    visit '/weather-dashboard'
  end

  it "sees header with welcome message and appropriate links" do

    expect(page).to have_content "Weather Dashboard"
    expect(page).to have_link "Home", href="/"
    expect(page).to have_link "Conditions", href='/conditions'
    expect(page).to have_link "Trips", href='/trips'
    expect(page).to have_link "Stations", href='/stations'
    
  end
end
