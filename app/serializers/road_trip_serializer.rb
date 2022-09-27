class RoadTripSerializer

  def self.format_road_trip(route, forecast)
    {
      "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
          "start_city": "#{route.start_city.capitalize}, #{route.start_state.upcase}",
          "end_city": "#{route.end_city.capitalize}, #{route.end_state.upcase}",
          "travel_time": route.travel_time,
          "weather_at_eta": {
            "temperature": forecast[:temperature],
            "conditions": forecast[:conditions]
          }
        }
      }
    }
  end
end
