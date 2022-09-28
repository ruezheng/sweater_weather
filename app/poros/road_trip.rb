class RoadTrip
  attr_reader :id,
              :start_city,
              :end_city,
              :travel_time,
              :distance
              # :weather_at_eta

  def initialize(origin, destination, route_data)
    @id = nil
    @start_city = self.format_city_and_state(origin)
    @end_city = format_city_and_state(destination)
    @travel_time = "#{route_data[:travel_time]} hrs"
    @distance = "#{route_data[:distance]} miles"
    # @weather_at_eta = weather_at_eta
  end

  def format_city_and_state(location)
    city = location.split(',').first.titleize
    state = location.split(',').last.upcase
    "#{city},#{state}"
  end
end
