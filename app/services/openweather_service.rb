class OpenweatherService
  def self.conn
    Faraday.new(url: "https://api.openweathermap.org")
  end

  def self.get_forecast(location)
    response = conn.get('/data/2.5/onecall') do |req|
      req.params['lat'] = location.lat
      req.params['lon'] = location.lng
      req.params['units'] = 'imperial'
      req.params['exclude'] = 'minutely,alerts'
      req.params['appid'] = ENV['openweather_key']
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end
