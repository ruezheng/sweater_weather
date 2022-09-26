class OpenlibraryFacade

  def self.create_books(location)
    books_data = OpenlibraryService.get_books(location)
    books_data[0..4].map do |book|
      Book.new(book)
    end 
  end
end
