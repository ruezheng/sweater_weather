class OpenlibraryService
  def self.conn
    Faraday.new(url: "https://openlibrary.org")
  end

  def self.get_books(location)
    response = conn.get("/search.json") do |req|
      req.params['q'] = location[0][:adminArea5]
    end

    parsed_json = JSON.parse(response.body, symbolize_names: true)
    parsed_json[:docs][0]
  end
end
