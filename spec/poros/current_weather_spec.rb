require 'rails_helper'

RSpec.describe CurrentWeather do
  it 'exists and has attributes for the current weather forecast', :vcr do
    data = JSON.parse(File.read('spec/fixtures/openweather_response.json'), symbolize_names: true)[:current]

    forecast = CurrentWeather.new(data)

    expect(forecast).to be_a(CurrentWeather)
    expect(forecast.date).to eq("2022-08-19 13:06:32.000000000 -0600")
    expect(forecast.sunrise).to eq("2022-08-19 06:16:01.000000000 -0600")
    expect(forecast.sunset).to eq("2022-08-19 19:51:24.000000000 -0600")
    expect(forecast.temperature).to eq(78.8)
    expect(forecast.feels_like).to eq(78.8)
    expect(forecast.humidity).to eq(40)
    expect(forecast.uvi).to eq(7)
    expect(forecast.visibility).to eq(10000)
    expect(forecast.conditions).to eq("overcast clouds")
    expect(forecast.icon).to eq("04d")
  end
end
