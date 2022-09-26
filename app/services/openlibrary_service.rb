class OpenlibraryService
  def self.conn
    Faraday.new(url: "https://openlibrary.org")
  end

  def self.get_books(location)
    response = conn.get("/search.json") do |req|
      req.params['q'] = location.city
    end

    parsed_json = JSON.parse(response.body, symbolize_names: true)
    parsed_json[:docs]
  end
end
