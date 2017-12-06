require 'spec_helper'

describe Condition do
  before(:each) do

   @condition_1 = Condition.create(date: "29/5/2003",
                        max_temperature_f: 70.0,
                        mean_temperature_f: 65.0,
                        min_temperature_f: 63.0,
                        mean_humidity: 50.0,
                        mean_visibility_miles: 3,
                        mean_wind_speed_mph: 5,
                        precipitation_inches: 1)

  @condition_2 =  Condition.create(date: "25/5/2003",
                        max_temperature_f: 60.0,
                        mean_temperature_f: 65.0,
                        min_temperature_f: 63.0,
                        mean_humidity: 50.0,
                        mean_visibility_miles: 3,
                        mean_wind_speed_mph: 5,
                        precipitation_inches: 1)

  @condition_3 =  Condition.create(date: "25/5/2003",
                        max_temperature_f: 65.0,
                        mean_temperature_f: 65.0,
                        min_temperature_f: 63.0,
                        mean_humidity: 50.0,
                        mean_visibility_miles: 3,
                        mean_wind_speed_mph: 5,
                        precipitation_inches: 1)
  end

  describe "Class Methods" do
    it "can find the number of trips on days within temperature range" do

    end

    it "can find the number of days within a temperature range" do
    end

    it "can find the average number of rides in a temperature range" do
    end

    it "can find the highest number of rides in a temperature range" do
    end

    it "can find the lowest number of rides in a temperature range" do
    end

    it "can find the maximum temp for all days" do
    end

    it "can find the minimum temp for all days" do
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
