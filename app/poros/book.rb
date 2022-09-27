class Book
  attr_reader :title,
              :isbn,
              :publisher,
              :num_found

  def initialize(book_data, num_found)
    @title = book_data[:title]
    @isbn = book_data[:isbn]
    @publisher = book_data[:publisher]
    @num_found = num_found
  end 
end
