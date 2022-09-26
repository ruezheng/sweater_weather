class WeatherForecast
  attr_reader :current, :daily, :hourly, :id

  def initialize(data)
    @current = CurrentWeather.new(data[:current])
    @daily = data[:daily][0..4].map { |data| DailyWeather.new(data) }
    @hourly = data[:hourly][0..7].map { |data| HourlyWeather.new(data) }
    @id = nil
  end
end
