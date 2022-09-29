class RoadTripSerializer

  def self.format_road_trip(trip_data, weather_at_eta)
    {
      "data": {
        "id": nil,
        "type": "roadtrip",
        "attributes": {
          "origin": trip_data.origin,
          "destination": trip_data.destination,
          "travel_time": trip_data.travel_time,
          "weather_at_eta": {
            "temperature": weather_at_eta.temperature,
            "conditions": weather_at_eta.conditions
          }
        }
      }
    }
  end
end
