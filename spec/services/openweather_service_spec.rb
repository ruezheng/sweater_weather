require 'rails_helper'

RSpec.describe OpenweatherService do
  let!(:location) { MapquestFacade.create_coordinates('denver,co') }
  let!(:forecast) { OpenweatherService.get_forecast(location) }

  describe 'happy path', :vcr do
    it "fetches weather forecast data to a user based on coordinates consumed by a mapquest api response" do
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

end
