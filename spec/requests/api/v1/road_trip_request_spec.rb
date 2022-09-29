require 'rails_helper'

RSpec.describe 'Road Trip Endpoint' do
  describe '#create' do
    context 'happy path' do
      it 'creates a new road trip', :vcr do
        user = User.create!(email: 'user@example.com', password: 'test123', password_confirmation: 'test123', api_key: "b9fda3e3eb9842dc9654c75716f99ead")

        params = {
          "origin": "Denver,CO",
          "destination": "Pueblo,CO",
          "api_key": "b9fda3e3eb9842dc9654c75716f99ead"
        }
        
        headers = {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        }
        
        post '/api/v1/road_trip', headers: headers, params: JSON.generate(params)

        parsed_json = JSON.parse(response.body, symbolize_names: true)
        
        road_trip = parsed_json[:data]
        
        expect(response.status).to eq(200)
        expect(road_trip.keys).to contain_exactly(:id, :type, :attributes)
        expect(road_trip[:id]).to eq(nil)
        expect(road_trip[:type]).to eq('roadtrip')
        expect(road_trip[:attributes]).to be_a(Hash)
        
        expect(road_trip[:attributes].keys).to contain_exactly(:origin, :destination, :travel_time, :weather_at_eta)
        expect(road_trip[:attributes][:weather_at_eta].keys).to contain_exactly(:temperature, :conditions)
      end
    end

    context 'sad path' do
      it 'returns a 401 status code error unauthorized if road trip is not successfully created' do
                user = User.create!(email: 'user@example.com', password: 'test123', password_confirmation: 'test123', api_key: "b9fda3e3eb9842dc9654c75716f99ead")

        params = {
          "origin": "Denver,CO",
          "destination": "Pueblo,CO",
          "api_key": "invalid key"
        }
        
        headers = {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        }
        
        post '/api/v1/road_trip', headers: headers, params: JSON.generate(params)

        parsed_json = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(401)
      end
    end
  end
end
