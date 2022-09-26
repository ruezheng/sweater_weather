require 'rails_helper'

RSpec.describe OpenlibraryService do
  describe 'happy path', :vcr do
    it "returns book data to a user based on location provided by mapquest api" do
      location = MapquestService.get_coordinates("denver,co")
      book_data = OpenlibraryService.get_books(location)
      
binding.pry
      expect(book_data).to be_an(Array)
      expect(book_data[0][:isbn]).to be_a(Array)
      expect(book_data[0][:isbn][0]).to be_a(String)
      expect(book_data[0][:title]).to be_a(String)
      expect(book_data[0][:publisher]).to be_a(String)
    end
  end
end
