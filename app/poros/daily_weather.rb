class DailyWeather
  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon

  def initialize(data)
    @date = Time.at(data[:dt]).to_s.split.first
    @sunrise = Time.at(data[:sunrise]).to_s.split.second
    @sunset = Time.at(data[:sunset]).to_s.split.second
    @max_temp = data[:temp][:max].to_f
    @min_temp = data[:temp][:min].to_f
    @conditions = data[:weather][0][:description]
    @icon = data[:weather][0][:icon]
  end
end