require 'rails_helper'

RSpec.describe WeatherAtEta do
  it 'exists and has temperature and conditions of destination at arrival as attributes', :vcr do
    destination = MapquestFacade.create_coordinates('denver,co')

    travel_time = MapquestFacade.create_travel_time('new york,ny', 'los angeles,ca')
    
    weather_at_eta = OpenweatherFacade.create_weather_at_eta(destination, travel_time)

    expect(weather_at_eta).to be_a(WeatherAtEta)
    expect(weather_at_eta.temperature).to eq(56.55)
    expect(weather_at_eta.conditions).to eq("light rain")
  end
end