require 'rails_helper'

RSpec.describe 'Road Trip Endpoint' do
  describe '#create' do
    context 'happy path' do
      it 'creates a new road trip', :vcr do
        params = {
            "origin": "Denver,CO",
            "destination": "Pueblo,CO",
            "api_key": "jgn983hy48thw9begh98h4539h4"
          }
        
        expect(response.status).to eq(200)

        parsed_json = JSON.parse(response.body, symbolize_names: true)
        forecast = parsed_json[:data]

        expect(forecast.keys).to contain_exactly(:id, :type, :attributes)
        expect(forecast[:id]).to eq(nil)
        expect(forecast[:type]).to eq('forecast')
        expect(forecast[:attributes]).to be_a(Hash)
        
        expect(forecast[:attributes].keys).to contain_exactly(:current_weather, :daily_weather, :hourly_weather)
      end
    end
  
    # context 'sad path' do
    #   it 'does not return minutely, weekly, or alerts data', :vcr do
    #     parsed_json = JSON.parse(response.body, symbolize_names: true)
    #     forecast = parsed_json[:data]

    #     expect(forecast[:attributes]).to_not have_key(:minutely_weather)
    #     expect(forecast[:attributes]).to_not have_key(:alerts)
    #     expect(forecast[:attributes]).to_not have_key(:weekly_weather)
    #   end
    # end
  end
end
