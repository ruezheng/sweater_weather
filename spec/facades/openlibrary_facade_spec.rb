require 'rails_helper'

RSpec.describe OpenlibraryFacade do
  describe '::create_books' do
    it 'returns a list of 5 book poros with title, isbn, and publisher as attributes', :vcr do
      location = MapquestFacade.create_coordinates('denver,co')
      forecast = OpenweatherFacade.create_forecast(location)
      books = OpenlibraryFacade.create_books(location)
      
      expect(books.count).to eq(5)
      
      books.each do |book|
        expect(book).to be_a(Book)
        expect(book.title).to be_a(String)
        expect(book.isbn[0]).to be_a(String)
        expect(book.publisher[0]).to be_a(String)
      end 
    end
  end
end
