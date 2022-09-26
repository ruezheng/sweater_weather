require 'rails_helper'

RSpec.describe OpenweatherFacade do
  describe '::create_forecast', :vcr do
    let!(:location) { MapquestFacade.create_coordinates('denver,co') }
    let!(:forecast) { OpenweatherFacade.create_forecast(location) }

    it 'returns a hash of current, daily, and hourly weather forecasts' do
      current_forecast = forecast.current
      # daily_forecast = weather_forecast.daily[0]
      # hourly_forecast = weather_forecast.hourly[0]
      
      expect(current_forecast).to be_a(CurrentWeather)
      # expect(current_forecast.date).to be_a(Datetime)
      # expect(current_forecast.sunrise).to be_a(String)
      # expect(current_forecast.sunset).to be_a(String)
      expect(current_forecast.temperature).to be_an(Float)
      expect(current_forecast.feels_like).to be_a(Float)
      expect(current_forecast.humidity).to be_a(Integer)
      expect(current_forecast.uvi).to be_an(Integer)
      expect(current_forecast.visibility).to be_a(Integer)
      expect(current_forecast.conditions).to be_a(String)
      expect(current_forecast.icon).to be_a(String)
    end
  end
end
    
