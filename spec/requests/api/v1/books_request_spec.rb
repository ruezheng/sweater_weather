require 'rails_helper'

RSpec.describe 'OpenLibrary API Books Request' do
  describe '#search' do
    before do
      get '/api/v1/book-search?location=denver,co&quantity=5'
    end

    context 'happy path' do
      it 'returns serialized data for 5 books about a destination city provided by the user search', :vcr do
        expect(response.status).to eq(200)

        parsed_json = JSON.parse(response.body, symbolize_names: true)
        books = parsed_json[:data]

        expect(books.keys).to contain_exactly(:id, :type, :attributes)
        expect(books[:id]).to eq('null')
        expect(books[:type]).to eq('book')
        expect(books[:attributes]).to be_a(Hash)
        
        expect(books[:attributes].keys).to contain_exactly(:destination, :forecast, :total_books_found, :books)
        expect(books[:attributes][:forecast].keys).to contain_exactly(:summary, :temperature)
        expect(books[:attributes][:books][0].keys).to contain_exactly(:isbn, :title, :publisher)
        expect(books[:attributes][:books].count).to eq(5)
      end
    end
  end
end
