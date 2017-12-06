require 'spec_helper'

describe Trip do
  describe "Validations" do
    it "is invalid without a duration" do
      trip = Trip.create(start_date: DateTime.now,
        start_station_name: "Japan",
        start_station_id: 5,
        end_date: DateTime.now,
        end_station_name: "Narita",
        end_station_id: 7,
        bike_id: 105,
        subscription_type: "Subscriber")

      expect(trip).to be_invalid
    end
    it "is invalid without a start date" do
      trip = Trip.create(duration: 35,
        start_station_name: "Japan",
        start_station_id: 5,
        end_date: DateTime.now,
        end_station_name: "Narita",
        end_station_id: 7,
        bike_id: 105,
        subscription_type: "Subscriber")

      expect(trip).to be_invalid
    end
    it "is invalid without a start station name" do
      trip = Trip.create(duration: 35,
        start_date: DateTime.now,
        start_station_id: 5,
        end_date: DateTime.now,
        end_station_name: "Narita",
        end_station_id: 7,
        bike_id: 105,
        subscription_type: "Subscriber")

      expect(trip).to be_invalid
    end
    it "is invalid without a start station ID" do
      trip = Trip.create(duration: 35,
        start_date: DateTime.now,
        start_station_name: "Japan",
        end_date: DateTime.now,
        end_station_name: "Narita",
        end_station_id: 7,
        bike_id: 105,
        subscription_type: "Subscriber")

      expect(trip).to be_invalid
    end
    it "is invalid without a end date" do
      trip = Trip.create(duration: 35,
        start_date: DateTime.now,
        start_station_name: "Japan",
        start_station_id: 5,
        end_station_name: "Narita",
        end_station_id: 7,
        bike_id: 105,
        subscription_type: "Subscriber")

      expect(trip).to be_invalid
    end
    it "is invalid without a end station name" do
      trip = Trip.create(duration: 35,
        start_date: DateTime.now,
        start_station_name: "Japan",
        start_station_id: 5,
        end_date: DateTime.now,
        end_station_id: 7,
        bike_id: 105,
        subscription_type: "Subscriber")

      expect(trip).to be_invalid
    end
    it "is invalid without a end station id" do
      trip = Trip.create(duration: 35,
        start_date: DateTime.now,
        start_station_name: "Japan",
        start_station_id: 5,
        end_date: DateTime.now,
        bike_id: 105,
        subscription_type: "Subscriber")

      expect(trip).to be_invalid
    end
    it "is invalid without a bike id" do
      trip = Trip.create(duration: 35,
        start_date: DateTime.now,
        start_station_name: "Japan",
        start_station_id: 5,
        end_date: DateTime.now,
        end_station_id: 7,
        subscription_type: "Subscriber")

      expect(trip).to be_invalid
    end
    it "is invalid without a subscription type " do
      trip = Trip.create(duration: 35,
        start_date: DateTime.now,
        start_station_name: "Japan",
        start_station_id: 5,
        end_date: DateTime.now,
        end_station_id: 7,
        bike_id: 105)

      expect(trip).to be_invalid
    end
  end

  describe "Class Methods" do
    before(:each) do
      @trip1 = Trip.create(duration: 35, start_date: "12/5/2017",
        start_station_name: "Japan", start_station_id: 5,
        end_date: DateTime.now, end_station_name: "Narita",
        end_station_id: 7, bike_id: 105, subscription_type: "Subscriber")

      @trip2 = Trip.create(duration: 40, start_date: "12/5/2017",
        start_station_name: "Japan", start_station_id: 5,
        end_date: DateTime.now, end_station_name: "Narita",
        end_station_id: 7, bike_id: 105, subscription_type: "Customer")

      @trip3 = Trip.create(duration: 45, start_date: "29/5/2003",
        start_station_name: "Japan", start_station_id: 5,
        end_date: DateTime.now, end_station_name: "Narita",
        end_station_id: 7, bike_id: 37, subscription_type: "Subscriber")
    end

    it "can find average ride duration" do
      expect(Trip.average_ride_duration).to eq(40)
    end

    it "can find the longest ride" do
      expect(Trip.longest_ride).to eq(45)
    end

    it "can find the shortest ride" do
      expect(Trip.shortest_ride).to eq(35)
    end

    it "can calculate the total rides per month" do
      expected = {"May 2017"=>2, "May 2003"=>1}
      expect(Trip.total_rides_per_month).to eq(expected)
    end

    it "can calculate the total rides per year" do
      expected = {2017=>2, 2003=>1}
      expect(Trip.total_rides_per_year).to eq(expected)
    end

    it "can find the most ridden bike" do
      expect(Trip.most_ridden_bike).to eq(105)
    end

    it "can find the least ridden bike" do
      expect(Trip.least_ridden_bike).to eq(37)
    end

    it "can determine the subscription type breakout by type" do
      expected = {"Subscriber"=>2, "Customer"=>1}
      expect(Trip.subscription_type_breakout).to eq expected
    end

    it "can calculate total subscriptions" do
      expect(Trip.total_subscriptions).to eq(3)
    end

    it "can find the percentage of subscriptions by type" do
      expected = {"Subscriber"=>66.67, "Customer"=>33.33}
      expect(Trip.percentage_subscription_type).to eq expected
    end

    it "can find the date with the most trips" do
      expect(Trip.date_with_highest_trips).to eq("12/5/2017")
    end

    it "can find the date with the fewest trips" do
      expect(Trip.date_with_lowest_trips).to eq("5/29/2003")
    end

    it "can find the weather conditions on the date with the most rides" do
      weather_1 = Condition.create(date: "12/5/2017",
                        max_temperature_f: 70.0,
                        mean_temperature_f: 65.0,
                        min_temperature_f: 63.0,
                        mean_humidity: 50.0,
                        mean_visibility_miles: 3,
                        mean_wind_speed_mph: 5,
                        precipitation_inches: 1)
      expect(Trip.weather_on_day_with_most_rides).to eq weather_1
    end

    it "can find the weather conditions on the date with the fewest rides" do
      weather_2 = Condition.create(date: "29/5/2003",
                        max_temperature_f: 70.0,
                        mean_temperature_f: 65.0,
                        min_temperature_f: 63.0,
                        mean_humidity: 50.0,
                        mean_visibility_miles: 3,
                        mean_wind_speed_mph: 5,
                        precipitation_inches: 1)
      expect(Trip.weather_on_day_with_least_rides).to eq weather_2
    end

  end

end
