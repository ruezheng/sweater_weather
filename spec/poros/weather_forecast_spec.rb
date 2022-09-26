require 'rails_helper'

RSpec.describe WeatherForecast do
  it 'iterates through the weather forecast and returns current, daily, and hourly weather poros with associated attributes' do
    data = JSON.parse(File.read('spec/fixtures/openweather_response.json'), symbolize_names: true)

    weather_forecast = WeatherForecast.new(data)

    expect(weather_forecast).to be_a(WeatherForecast)
    expect(weather_forecast.current_weather).to be_a(CurrentWeather)
    expect(weather_forecast.daily_weather[0]).to be_a(DailyWeather)
    expect(weather_forecast.hourly_weather[0]).to be_a(HourlyWeather)
    expect(weather_forecast.id).to eq(nil)
  end
end
