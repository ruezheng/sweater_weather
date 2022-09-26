class OpenweatherFacade

  def self.create_forecast(location)
    parsed_json = OpenweatherService.get_forecast(location)
    
    WeatherForecast.new(parsed_json)
  end
end
