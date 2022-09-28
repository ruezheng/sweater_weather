require 'rails_helper'

RSpec.describe OpenweatherFacade do
  describe '::create_forecast', :vcr do
    it 'returns a hash of current, daily, and hourly weather forecasts and their attributes' do
      location = MapquestFacade.create_coordinates('denver,co')
      forecast = OpenweatherFacade.create_forecast(location)

      current_forecast = forecast.current_weather
      
      expect(current_forecast).to be_a(CurrentWeather)
      expect(current_forecast.date).to eq('2022-09-28')
      expect(current_forecast.sunrise).to eq('06:53:13')
      expect(current_forecast.sunset).to eq('18:47:48')
      expect(current_forecast.temperature).to be_an(Float)
      expect(current_forecast.feels_like).to be_a(Float)
      expect(current_forecast.humidity).to be_a(Integer)
      expect(current_forecast.uvi).to be_an(Integer)
      expect(current_forecast.visibility).to be_a(Integer)
      expect(current_forecast.conditions).to be_a(String)
      expect(current_forecast.icon).to be_a(String)

      daily_forecast = forecast.daily_weather[0]

      expect(daily_forecast).to be_a(DailyWeather)
      expect(daily_forecast.date).to eq("2022-09-28")
      expect(daily_forecast.sunrise).to eq("06:53:13")
      expect(daily_forecast.sunset).to eq("18:47:48")
      expect(daily_forecast.max_temp).to be_a(Float)
      expect(daily_forecast.min_temp).to be_a(Float)
      expect(daily_forecast.conditions).to be_a(String)
      expect(daily_forecast.icon).to be_a(String)
        
      hourly_forecast = forecast.hourly_weather[0]

      expect(hourly_forecast).to be_a(HourlyWeather)
      expect(hourly_forecast.time).to eq("10:00:00")
      expect(hourly_forecast.temperature).to be_a(Float)
      expect(hourly_forecast.conditions).to be_a(String)
      expect(hourly_forecast.icon).to be_a(String)
    end
  end

  describe '::create_weather_at_eta', :vcr do
   xit 'returns hourly weather data for destination city based on time of arrival' do
      destination = MapquestFacade.create_coordinates('new york,ny')
      forecast = OpenweatherFacade.create_forecast(destination)

    end
  end
end
    
