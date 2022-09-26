class MapquestService
  def self.conn
    Faraday.new(url: "http://www.mapquestapi.com/")
  end


end
