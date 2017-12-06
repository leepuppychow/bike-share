require 'spec_helper'

describe Condition do
  before(:each) do
    Trip.create(duration: 5, start_date: "2017/12/1", start_station_name: "Lee", start_station_id: 2, end_date: "2017/1/12", end_station_name: "Lee", end_station_id: 10, bike_id: 15, subscription_type: "Customer", zip_code: 80241)
    Trip.create(duration: 5, start_date: "2017/12/1", start_station_name: "Lee", start_station_id: 2, end_date: "2017/1/12", end_station_name: "Lee", end_station_id: 10, bike_id: 15, subscription_type: "Customer", zip_code: 80241)
    Trip.create(duration: 5, start_date: "2017/12/1", start_station_name: "Lee", start_station_id: 2, end_date: "2017/1/12", end_station_name: "Lee", end_station_id: 10, bike_id: 15, subscription_type: "Customer", zip_code: 80241)
    Trip.create(duration: 5, start_date: "2017/12/5", start_station_name: "Lee", start_station_id: 2, end_date: "2017/1/12", end_station_name: "Lee", end_station_id: 10, bike_id: 15, subscription_type: "Customer", zip_code: 80241)
    Trip.create(duration: 5, start_date: "2017/12/5", start_station_name: "Lee", start_station_id: 2, end_date: "2017/1/12", end_station_name: "Lee", end_station_id: 10, bike_id: 15, subscription_type: "Customer", zip_code: 80241)
    Trip.create(duration: 5, start_date: "2017/12/6", start_station_name: "Lee", start_station_id: 2, end_date: "2017/1/12", end_station_name: "Lee", end_station_id: 10, bike_id: 15, subscription_type: "Customer", zip_code: 80241)
    Trip.create(duration: 5, start_date: "2017/11/18", start_station_name: "Lee", start_station_id: 2, end_date: "2017/1/12", end_station_name: "Lee", end_station_id: 10, bike_id: 15, subscription_type: "Customer", zip_code: 80241)
    Trip.create(duration: 5, start_date: "2017/11/18", start_station_name: "Lee", start_station_id: 2, end_date: "2017/1/12", end_station_name: "Lee", end_station_id: 10, bike_id: 15, subscription_type: "Customer", zip_code: 80241)
    Trip.create(duration: 5, start_date: "2017/11/20", start_station_name: "Lee", start_station_id: 2, end_date: "2017/1/12", end_station_name: "Lee", end_station_id: 10, bike_id: 15, subscription_type: "Customer", zip_code: 80241)
    Trip.create(duration: 5, start_date: "2017/11/20", start_station_name: "Lee", start_station_id: 2, end_date: "2017/1/12", end_station_name: "Lee", end_station_id: 10, bike_id: 15, subscription_type: "Customer", zip_code: 80241)

    Condition.create(date: "2017/12/6", max_temperature_f: 61.0, mean_temperature_f: 60.0, min_temperature_f: 58.0, mean_humidity: 10.0, mean_visibility_miles: 8.0, mean_wind_speed_mph: 1.0, precipitation_inches: 1)
    Condition.create(date: "2017/12/5", max_temperature_f: 65.0, mean_temperature_f: 60.0, min_temperature_f: 58.0, mean_humidity: 10.0, mean_visibility_miles: 8.0, mean_wind_speed_mph: 1.0, precipitation_inches: 1)
    Condition.create(date: "2017/12/1", max_temperature_f: 66.0, mean_temperature_f: 60.0, min_temperature_f: 58.0, mean_humidity: 10.0, mean_visibility_miles: 8.0, mean_wind_speed_mph: 1.0, precipitation_inches: 1)
    Condition.create(date: "2017/11/20", max_temperature_f: 79.0, mean_temperature_f: 60.0, min_temperature_f: 58.0, mean_humidity: 10.0, mean_visibility_miles: 8.0, mean_wind_speed_mph: 1.0, precipitation_inches: 1)
    Condition.create(date: "2017/11/18", max_temperature_f: 74.0, mean_temperature_f: 60.0, min_temperature_f: 58.0, mean_humidity: 10.0, mean_visibility_miles: 8.0, mean_wind_speed_mph: 1.0, precipitation_inches: 1)
  end

  describe "Class Methods" do

    it "can create joined trips to conditions" do
      expect(Condition.joined.count).to eq 10
    end

    it "can find the number of trips on days within temperature range" do
      expect(Condition.number_of_trips_for_days_within_temperature(60.0)).to eq 6
    end

    it "can find the number of days within a temperature range" do
      expect(Condition.number_of_days_with_temperature(60.0)).to eq 3
    end

    it "can find the average number of rides in a temperature range" do
      expect(Condition.average_number_of_rides_in_temperature_range(60.0)).to eq 2
    end

    it "can find the highest number of rides in a temperature range" do
      expect(Condition.highest_number_of_rides_in_temperature_range(60.0)).to eq 3
    end

    it "can find the lowest number of rides in a temperature range" do
      expect(Condition.lowest_number_of_rides_in_temperature_range(60.0)).to eq 1
    end

    it "can find the maximum temp for all days" do
      expect(Condition.highest_max_temperature_of_all_days).to eq 79.0
    end

    it "can find the minimum temp for all days" do
      expect(Condition.lowest_max_temperature_of_all_days).to eq 61.0
    end

    it "can find the number of trips on days within precipitation range" do
    end

    it "can find the number of days within a precipitation range" do
    end

    it "can find the average number of rides in a precipitation range" do
    end

    it "can find the highest number of rides in a precipitation range" do
    end

    it "can find the lowest number of rides in a precipitation range" do
    end

    it "can find the maximum precipitation for all days" do
    end

    it "can find the minimum precipitation for all days" do
    end

  end

  describe "Validations" do
    it "is invalid without a date" do
      skip
      weather = Condition.create(
        max_temperature_f: 70.0,
        mean_temperature_f: 65.0,
        min_temperature_f: 63.0,
        mean_humidity: 50.0,
        mean_visibility_miles: 3,
        mean_wind_speed_mph: 5,
        precipitation_inches: 1)

      expect(weather).to be_invalid
    end
  end

end
