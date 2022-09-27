class OpenlibraryService
  def self.conn
    Faraday.new(url: "https://openlibrary.org")
  end

  def self.get_books(location, quantity)
    response = conn.get("/search.json") do |req|
      req.params['q'] = location.city
      req.params['limit'] = quantity
    end
    parsed_json = JSON.parse(response.body, symbolize_names: true)
  end
end
