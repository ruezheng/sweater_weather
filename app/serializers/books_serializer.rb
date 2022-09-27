class BooksSerializer

  def self.format_books(location, forecast, books)
    {
      "data": {
        "id": "null",
        "type": "books",
        "attributes": {
          "destination": "#{location.city}, #{location.state}",
          "forecast": {
            "summary": forecast.conditions,
            "temperature": "#{forecast.temperature.to_i} F"
          },
          "total_books_found": books.first.num_found,
          "books": books.map do |book|
            {
              "isbn": book.isbn,
              "title": book.title,
              "publisher": book.publisher
            }
          end
        }
      }
    }
  end
end