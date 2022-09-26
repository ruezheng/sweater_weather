class OpenlibraryFacade

  def self.create_books(location)
    books_data = OpenlibraryService.get_books(location)
    num_found = books_data[:num_found]
    books_data.map do |book_data, num_found|
      Book.new(book_data, num_found)
    end 
  end
end
