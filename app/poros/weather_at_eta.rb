class WeatherAtEta
  attr_reader :temperature,
              :conditions

  def initialize(forecast, travel_time_in_hours)
    @temperature = temp_at_eta(forecast, travel_time_in_hours)
    @conditions = conditions_at_eta(forecast, travel_time_in_hours)
  end

  def temp_at_eta(forecast, travel_time_in_hours)
    if travel_time_in_hours > 48
      forecast[:daily][(travel_time_in_hours / 24)][:temp][:day]
    else
      forecast[:hourly][(travel_time_in_hours)][:temp]
    end
  end

  def conditions_at_eta(forecast, travel_time_in_hours)
    if travel_time_in_hours > 48
      forecast[:daily][(travel_time_in_hours / 24)][:weather][0][:description]
    else
      forecast[:hourly][(travel_time_in_hours)][:weather][0][:description]
    end
  end
end
