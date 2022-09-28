class OpenweatherFacade
  class << self

    def create_forecast(location)
      parsed_json = OpenweatherService.get_forecast(location)
      
      WeatherForecast.new(parsed_json)
    end

    def create_weather_at_eta(destination, hours)
      parsed_json = OpenweatherService.get_forecast(destination)

      WeatherForecast.new(parsed_json)
    end
  end
end
