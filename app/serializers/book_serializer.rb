class BookSerializer

  def self.format_book(book)
    {
      "data": {
        "id": "null",
        "type": "books",
        "attributes": {
          "destination": "denver,co",
          "forecast": {
            "summary": "Cloudy with a chance of meatballs",
            "temperature": "83 F"
          },
          "total_books_found": 172,
          "books": books[0..4].map do |book|
            {
              "isbn": [
                "0762507845",
                "9780762507849"
              ],
              "title": "Denver, Co",
              "publisher": [
                "Universal Map Enterprises"
              ]
            }
          end
        }
      }
    }
  end
end