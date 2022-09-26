require 'rails_helper'

RSpec.describe OpenlibraryService do
  describe '::get_books', :vcr do
    it "returns book data to a user based on location provided by mapquest api" do
      location = MapquestFacade.create_coordinates('denver,co')
      results = OpenlibraryService.get_books(location, 5)

      expect(results[:numFound]).to be_an(Integer)

      books = results[:docs]

      expect(books.count).to eq(5)

      expect(books).to be_an(Array)
      expect(books[0][:title]).to be_a(String)
      expect(books[0][:isbn]).to be_an(Array)
      expect(books[0][:isbn][0]).to be_a(String)
      expect(books[0][:publisher]).to be_an(Array)
      expect(books[0][:publisher][0]).to be_a(String)
    end
  end
end
