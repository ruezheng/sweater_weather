class CurrentWeather
  attr_reader :date,
              :sunrise,
              :sunset,
              :temperature,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon

  def initialize(data)
    @date = Time.at(data[:dt]).to_s.split.first
    @sunrise = Time.at(data[:sunrise]).to_s.split.second
    @sunset = Time.at(data[:sunset]).to_s.split.second
    @temperature = data[:temp]
    @feels_like = data[:feels_like]
    @humidity = data[:humidity]
    @uvi = data[:uvi].to_i
    @visibility = data[:visibility]
    @conditions = data[:weather][0][:description]
    @icon = data[:weather][0][:icon]
  end
end
