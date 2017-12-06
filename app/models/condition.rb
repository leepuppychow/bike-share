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
    if joined.where(max_temperature_f: range..range + 9).group(:start_date).count.invert.max
      joined.where(max_temperature_f: range..range + 9).group(:start_date).count.invert.max.first
    end

    # if joined.where(max_temperature_f: range..range + 9).count != 0
    #   joined.where(max_temperature_f: range..range + 9).group(:start_date).count.invert.max.first
    # end
  end

  def self.lowest_number_of_rides_in_temperature_range(range)
    if joined.where(max_temperature_f: range..range + 9).group(:start_date).count.invert.min
      joined.where(max_temperature_f: range..range + 9).group(:start_date).count.invert.min.first
    end

    # if joined.where(max_temperature_f: range..range + 9).count != 0 
    #   joined.where(max_temperature_f: range..range + 9).group(:start_date).count.invert.min.first
    # end
  end

  def self.highest_max_temperature_of_all_days
    maximum(:max_temperature_f)
  end

  def self.lowest_max_temperature_of_all_days
    minimum(:max_temperature_f)
  end

  def self.number_of_trips_for_days_within_precipitation(range)
    joined.where(precipitation_inches: range..range+0.49).count
  end

  def self.number_of_days_within_precipitation(range)
    joined.where(precipitation_inches: range..range+0.49).uniq.pluck(:date).count
  end

  def self.average_number_of_rides_in_precipitation(range)
    (number_of_trips_for_days_within_precipitation(range).to_f /
      number_of_days_within_precipitation(range)).round(2)
  end

  def self.highest_number_of_rides_in_precipitation_range(range)
    if joined.where(precipitation_inches: range..range+0.49).group(:date).count.invert.max
     joined.where(precipitation_inches: range..range+0.49).group(:date).count.invert.max.first
    end
  end

  def self.lowest_number_of_rides_in_precipitation_range(range)
    if joined.where(precipitation_inches: range..range+0.49).group(:date).count.invert.min
      joined.where(precipitation_inches: range..range+0.49).group(:date).count.invert.min.first
    end
  end

  def self.maximum_precipitation
    maximum(:precipitation_inches)
  end

  def self.minimum_precipitation
    minimum(:precipitation_inches)
  end

end
