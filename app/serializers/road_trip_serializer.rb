class RoadTripSerializer

  def self.format_road_trip(road_trip, forecast)
    {
      "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
          "start_city": "#{road_trip.start_city.capitalize}, #{road_trip.start_state.upcase}",
          "end_city": "#{road_trip.end_city.capitalize}, #{road_trip.end_state.upcase}",
          "travel_time": road_trip.travel_time,
          "weather_at_eta": {
            "temperature": forecast[:temperature],
            "conditions": forecast[:conditions]
          }
        }
      }
    }
  end
end
