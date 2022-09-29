class OpenweatherFacade
  class << self

    def create_forecast(location)
      parsed_json = OpenweatherService.get_forecast(location)
      
      WeatherForecast.new(parsed_json)
    end

    def create_weather_at_eta(destination, travel_time)
      forecast = OpenweatherService.get_forecast(destination)
      travel_time_in_hours = travel_time.split(':').first.to_i

      WeatherAtEta.new(forecast, travel_time_in_hours)
    end
  end
end
