require 'rails_helper'

RSpec.describe 'Road Trip Endpoint' do
  describe '#create' do
    context 'happy path' do
      it 'creates a new road trip', :vcr do
        user = User.create!(email: 'user@example.com', password: 'test123', password_confirmation: 'test123')
        api_key = user.generate_api_key

        params = {
          "origin": "Denver,CO",
          "destination": "Pueblo,CO",
          "api_key": api_key
        }
        
        headers = {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        }
        
        post '/api/v1/road_trip', headers: headers, params: JSON.generate(params)
          binding.pry
        parsed_json = JSON.parse(response.body, symbolize_names: true)
binding.pry
        road_trip = parsed_json[:data]
        
        expect(response.status).to eq(200)
        expect(road_trip.keys).to contain_exactly(:id, :type, :attributes)
        expect(road_trip[:id]).to eq(nil)
        expect(road_trip[:type]).to eq('roadtrip')
        expect(road_trip[:attributes]).to be_a(Hash)
        
        expect(forecast[:attributes].keys).to contain_exactly(:current_weather, :daily_weather, :hourly_weather)
      end
    end
  end
end
