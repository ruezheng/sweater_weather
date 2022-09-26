require 'rails_helper'

describe Book do
  it "returns book poro from JSON response with title, isbn, publisher, and total number of books found as attributes" do
    response = JSON.parse(File.read('spec/fixtures/openlibrary_response.json'), symbolize_names: true)
    books_data =  response[:docs]

    books = books_data.map do |book_data, num_found|
      Book.new(book_data, num_found)
    end

    book = books.first

    expect(book).to be_a(Book)
    expect(book.title).to eq('Denver, Co')
    expect(book.isbn).to eq ["0762507845", "9780762507849"]
    expect(book.publisher).to eq ["Universal Map Enterprises"]
    expect(books.num_found).to eq(47113)
  end
end