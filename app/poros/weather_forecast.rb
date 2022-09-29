class WeatherForecast
  attr_reader :current_weather, :daily_weather, :hourly_weather, :id

  def initialize(data)
    @id = nil
    @current_weather = CurrentWeather.new(data[:current])
    @daily_weather = data[:daily][0..4].map { |data| DailyWeather.new(data) }
    @hourly_weather = data[:hourly][0..7].map { |data| HourlyWeather.new(data) }
  end
end
