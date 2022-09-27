class OpenlibraryFacade

  def self.create_books(location, quantity)
    response = OpenlibraryService.get_books(location, quantity)

    num_found = response[:numFound]
    books_data = response[:docs]

    books = books_data.map do |book_data|
      Book.new(book_data, num_found)
    end
  end
end
