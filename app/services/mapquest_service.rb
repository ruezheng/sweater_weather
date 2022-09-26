class MapquestService
  def self.conn
    Faraday.new(url: "http://www.mapquestapi.com/")
  end

  def self.get_coordinates(location)
    response = conn.get("geocoding/v1/address") do |req|
      req.params['key'] = ENV['mapquest_api_key']
      req.params['location'] = location
    end
  end
end
