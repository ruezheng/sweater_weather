require 'rails_helper'

describe Book do
  it "returns book poro from JSON response with title, isbn, and publisher as attributes" do
    response = JSON.parse(File.read('spec/fixtures/openlibrary_response.json'), symbolize_names: true)
    book_data =  response[:docs][0]

    book = Book.new(book_data)
    
    expect(book).to be_a(Location)
    expect(book.title).to eq('Denver')
    expect(book.isbn).to eq('CO')
    expect(book.publisher).to eq(39.738453)
  end
end