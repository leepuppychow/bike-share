class Condition < ActiveRecord::Base
  has_many :trip_dates, :class_name => "Trip", :foreign_key => "start_date", :primary_key => "date"

  def self.joined
    joins(:trip_dates)
  end

  def self.number_of_trips_for_days_within_temperature(range)
    joined.where(max_temperature_f: range..range + 9).count
  end

  def self.number_of_days_with_temperature(range)
    joined.where(max_temperature_f: range..range+9).uniq.pluck(:date).count
  end

  def self.average_number_of_rides_in_temperature_range(range)
    (number_of_trips_for_days_within_temperature(range).to_f /
      number_of_days_with_temperature(range)).round(2)
  end

  def self.highest_number_of_rides_in_temperature_range(range)
    number_of_trips_for_days_within_temperature(range).group(:date).count
  end

  def self.maximum_temperature_of_all_days
    maximum(:max_temperature_f)
  end

  def self.minimum_temperature_of_all_days
    minimum(:min_temperature_f)
  end

end
