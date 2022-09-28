class MapquestService
  def self.conn
    Faraday.new(url: "http://www.mapquestapi.com")
  end

  def self.get_coordinates(location)
    response = conn.get("/geocoding/v1/address") do |req|
      req.params['key'] = ENV['mapquest_key']
      req.params['location'] = location
    end

    parsed_json = JSON.parse(response.body, symbolize_names: true)
    parsed_json[:results][0][:locations]
  end

  def self.get_route(origin, destination)
    response = conn.get("/directions/v2/route") do |req|
      req.params['key'] = ENV['mapquest_key']
      req.params['from'] = origin
      req.params['to'] = destination
    end

    parsed_json = JSON.parse(response.body, symbolize_names: true)
    parsed_json[:route][:legs][0]
  end
end
