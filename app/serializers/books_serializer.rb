class BooksSerializer

  def self.format_books(location, forecast, books)
    {
      "data": {
        "id": "null",
        "type": "books",
        "attributes": {
          "destination": "#{location.city, location.state}",
          "forecast": {
            "summary": current_weather_forecast.conditions,
            "temperature": "#{current_weather_forecast.temperature.to_i F}"
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