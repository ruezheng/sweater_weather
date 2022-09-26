require 'rails_helper'

RSpec.describe DailyWeather do
  it 'exists and has attributes for the daily weather forecast' do
    data = JSON.parse(File.read('spec/fixtures/openweather_response.json'), symbolize_names: true)[:daily][0]

    forecast = DailyWeather.new(data)

    expect(forecast).to be_a(DailyWeather)
    expect(forecast.date).to eq("2022-08-19 13:00:00.000000000 -0600")
    expect(forecast.sunrise).to eq("2022-08-19 06:16:01.000000000 -0600")
    expect(forecast.sunset).to eq("2022-08-19 19:51:24.000000000 -0600")
    expect(forecast.max_temp).to eq(81.99)
    expect(forecast.min_temp).to eq(68.49)
    expect(forecast.conditions).to eq("overcast clouds")
    expect(forecast.icon).to eq("04d")
  end
end
