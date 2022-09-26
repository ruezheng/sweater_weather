require 'rails_helper'

RSpec.describe 'OpenLibrary API Endpoint' do
  describe '#search' do
    before do
      get '/api/v1/book-search?location=denver,co&quantity=5'
    end

    context 'happy path' do
      it 'returns data for the destination city, current weather forecast, and books data', :vcr do
        expect(response.status).to eq(200)

        parsed_json = JSON.parse(response.body, symbolize_names: true)
        books = parsed_json[:data]

        expect(books.keys).to contain_exactly(:id, :type, :attributes)
        expect(books[:id]).to eq(nil)
        expect(books[:type]).to eq('book')
        expect(books[:attributes]).to be_a(Hash)
        
        expect(books[:attributes].keys).to contain_exactly(:current_weather, :daily_weather, :hourly_weather)
      end
    end
  end
end