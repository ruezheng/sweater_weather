class OpenweatherService
  def self.conn
    Faraday.new(url: "https://api.openweathermap.org")
  end

end
