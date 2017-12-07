require 'spec_helper'

describe "When user visits /trips-dashboard link" do
  
  before(:each) do
    @trip = Trip.create(duration: 35, start_date: "2017/12/6",
      start_station_name: "Japan", start_station_id: 5,
      end_date: "2017/12/6", end_station_name: "Narita",
      end_station_id: 7, bike_id: 105, subscription_type: "Subscriber")

    @trip2 = Trip.create(duration: 36,start_date: "2017/12/5",
      start_station_name: "Japan", start_station_id: 5,
      end_date: "2017/12/5", end_station_name: "Narita",
      end_station_id: 7, bike_id: 105,subscription_type: "Subscriber")

    @station = Station.create(name: "lee", dock_count: 50, city: "Denver", installation_date: DateTime.now)

    Condition.create(date: "2017/12/6", max_temperature_f: 61.0, mean_temperature_f: 60.0, min_temperature_f: 58.0, mean_humidity: 10.0, mean_visibility_miles: 8.0, mean_wind_speed_mph: 1.0, precipitation_inches: 0)
    Condition.create(date: "2017/12/5", max_temperature_f: 65.0, mean_temperature_f: 60.0, min_temperature_f: 58.0, mean_humidity: 10.0, mean_visibility_miles: 8.0, mean_wind_speed_mph: 1.0, precipitation_inches: 0.33)
    Condition.create(date: "2017/12/1", max_temperature_f: 66.0, mean_temperature_f: 60.0, min_temperature_f: 58.0, mean_humidity: 10.0, mean_visibility_miles: 8.0, mean_wind_speed_mph: 1.0, precipitation_inches: 0.55)
    Condition.create(date: "2017/11/20", max_temperature_f: 79.0, mean_temperature_f: 60.0, min_temperature_f: 58.0, mean_humidity: 10.0, mean_visibility_miles: 8.0, mean_wind_speed_mph: 1.0, precipitation_inches: 0)
    Condition.create(date: "2017/11/18", max_temperature_f: 74.0, mean_temperature_f: 60.0, min_temperature_f: 58.0, mean_humidity: 10.0, mean_visibility_miles: 8.0, mean_wind_speed_mph: 1.0, precipitation_inches: 0.65)

    visit '/trips-dashboard'

  end

  it "sees page with appropriate header title and links" do
    
    expect(page).to have_content "Trip Dashboard"
    expect(page).to have_link "Trips", :href=>'/trips'
    expect(page).to have_link "Stations", :href=>'/stations'
    expect(page).to have_link "Station Dashboard", :href=>'/stations-dashboard'
    expect(page).to have_link "Home", :href=>'/'
  end

  it "sees tables with appropriate titles for data" do

    expect(page).to have_content "Average Ride Duration"
    expect(page).to have_content 35.5
    expect(page).to have_content "Station with most rides as ending place:"
    expect(page).to have_content "Date with most trips:"
    expect(page).to have_content "Least ridden bike ID:"
    expect(page).to have_content "User subscription breakout by percent:"
    expect(page).to have_content "Weather for day with fewest trips:"
    expect(page).to have_content "Month-month breakdown of total rides:"
    expect(page).to have_content "Precipitation(in)"    
  end
end
