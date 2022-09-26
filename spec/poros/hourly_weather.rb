require 'rails_helper'

RSpec.describe HourlyWeather do
  it 'exists and has attributes for the hourly weather forecast', :vcr do
    data = JSON.parse(File.read('spec/fixtures/openweather_response.json'), symbolize_names: true)[:hourly][0]
    hourly_forecast = HourlyWeather.new(data)

    expect(hourly_forecast).to be_a(HourlyWeather)
    expect(hourly_forecast.time).to eq("2022-08-19 13:00:00.000000000 -0600")
    expect(hourly_forecast.temperature).to eq(78.8)
    expect(hourly_forecast.conditions).to eq("overcast clouds")
    expect(hourly_forecast.icon).to eq("04d")
  end
end