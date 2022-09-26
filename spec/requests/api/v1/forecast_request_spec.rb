require 'rails_helper'

RSpec.describe 'Openweather Forecast Endpoint' do
  describe '#index' do
    before do
      get '/api/v1/forecast?location=denver,co'
    end

    context 'happy path' do
      it 'returns the current, daily, and hourly weather forecasts', :vcr do
        expect(response.status).to eq(200)

        parsed_json = JSON.parse(response.body, symbolize_names: true)
        forecast = parsed_json[:data]

        expect(forecast.keys).to contain_exactly(:id, :type, :attributes)
        expect(forecast[:id]).to eq(nil)
        expect(forecast[:type]).to eq('forecast')
        expect(forecast[:attributes]).to be_a(Hash)
        
        expect(forecast[:attributes].keys).to contain_exactly(:current, :daily, :hourly)
      end
    end
  end
end