require 'rails_helper'

RSpec.describe OpenlibraryFacade do
  describe '::create_books' do
    it 'returns a list of book poros with title, isbn, publisher, and number of books found as attributes', :vcr do
      location = MapquestFacade.create_coordinates('denver,co')
      forecast = OpenweatherFacade.create_forecast(location)
      books = OpenlibraryFacade.create_books(location, 5)
      
      expect(books.count).to eq(5)

      books.each do |book|
        expect(book).to be_a(Book)
        expect(book.title).to be_a(String)
        expect(book.isbn.first).to be_a(String)
        expect(book.publisher.first).to be_a(String)
        expect(book.num_found).to be_an(Integer)
      end 
    end
  end
end
