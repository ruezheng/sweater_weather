require 'rails_helper'

describe Book do
  it "returns book poro from JSON response with title, isbn, publisher, and total number of books found as attributes" do
    response = JSON.parse(File.read('spec/fixtures/openlibrary_response.json'), symbolize_names: true)
    book_data =  response[:docs][0]

    book = Book.new(book_data)
    
    expect(book).to be_a(Book)
    expect(book.title).to eq('Denver, Co')
    expect(book.isbn).to eq ["0762507845", "9780762507849"]
    expect(book.publisher).to eq ["Universal Map Enterprises"]
    expect(book.num_found).to eq(47113)
  end
end