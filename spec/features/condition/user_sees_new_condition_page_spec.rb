require 'spec_helper'

describe "when user visits /conditions/new path" do
  it "will show a Create New Condition page" do
    visit '/conditions/new'

    expect(page).to have_content("New Condition")
  end

  it "will see links for home, conditions index" do
    visit '/conditions/new'

    expect(page).to have_link("Conditions", :href => "/conditions")
    expect(page).to have_link("Home", :href=>"/")
    expect(page).to have_link("Weather Dashboard", :href=>"/weather-dashboard")
    
  end

  it "will see form to enter information for condition" do
    visit '/conditions/new'

    expect(page).to have_content("Condition:")
    expect(page).to have_content("Max Temp(F):")
    expect(page).to have_content("Mean Temp(F):")
    expect(page).to have_content("Min Temp(F):")
    expect(page).to have_content("Mean Visibility(miles):")    
    expect(page).to have_content("Precipitation(inches):")
  end

end
