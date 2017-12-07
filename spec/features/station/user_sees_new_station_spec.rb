require 'spec_helper'

describe "when user visits /stations/new path" do
  before :each do
    visit "/stations/new"
  end
  it "will show a create new station page" do 
    
    expect(page).to have_content("New Station")
    expect(page).to have_content("Station Name:")
    expect(page).to have_content("Number of Docks:")
    expect(page).to have_content("City:")
    expect(page).to have_content("Installation Date:")
          
  end
  it "will see back to station index and home links" do
    
    expect(page).to have_link("Home", :href=>'/')
    expect(page).to have_link("Stations", :href=>'/stations')    
    expect(page).to have_link("Station Dashboard", :href=>'/stations-dashboard')    
    
  end
end