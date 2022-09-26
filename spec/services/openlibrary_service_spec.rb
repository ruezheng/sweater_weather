require 'rails_helper'

RSpec.describe OpenlibraryService do
  describe 'happy path', :vcr do
    it "returns book data to a user based on location provided by mapquest api" do
      location = MapquestService.get_coordinates("denver,co")
      books = OpenlibraryService.get_books(location)
      
      expect(books).to be_an(Array)
      expect(books[0][:title]).to be_a(String)
      expect(books[0][:isbn]).to be_an(Array)
      expect(books[0][:isbn][0]).to be_a(String)
      expect(books[0][:publisher]).to be_an(Array)
      expect(books[0][:publisher][0]).to be_a(String)
    end
  end
end
