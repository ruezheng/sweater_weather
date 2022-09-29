class RoadTrip
  attr_reader :id,
              :origin,
              :destination,
              :travel_time,
              :distance
              :weather_at_eta

  def initialize(origin, destination, travel_time)
    @id = nil
    @origin = self.format_city_and_state(origin)
    @destination = format_city_and_state(destination)
    @travel_time = format_time(travel_time)
    @distance = "#{route_data[:distance]} miles"
  end

  def format_city_and_state(location)
    city = location.split(',').first.titleize
    state = location.split(',').last.upcase
    "#{city},#{state}"
  end

  def format_time(travel_time)
    hours = travel_time.split(':').first
    minutes = travel_time.split(':').second

    "#{hours} hours, #{minutes} minutes"
  end
end
