require 'rails_helper'

RSpec.describe OpenweatherService do
  let!(:location) { MapquestFacade.create_coordinates('denver,co') }
  let!(:forecast) { OpenweatherService.get_forecast(location) }

  describe 'happy path', :vcr do
    it "fetches weather forecast data by coordinates provided by a mapquest api geodata" do
      expect(forecast).to be_a(Hash)
      expect(forecast[:current]).to have_key(:dt)
      expect(forecast[:current]).to have_key(:sunrise)
      expect(forecast[:current]).to have_key(:temp)
      expect(forecast[:current]).to have_key(:feels_like)
      expect(forecast[:current]).to have_key(:pressure)
      expect(forecast[:current]).to have_key(:humidity)
      expect(forecast[:current]).to have_key(:dew_point)
      expect(forecast[:current]).to have_key(:uvi)
      expect(forecast[:current]).to have_key(:clouds)
      expect(forecast[:current]).to have_key(:visibility)
    end
  end

  describe 'sad path', :vcr do
    it 'does not fetch data for minutely or alerts' do
      expect(forecast).to_not have_key(:minutely)
      expect(forecast).to_not have_key(:alerts)
    end
  end
end
