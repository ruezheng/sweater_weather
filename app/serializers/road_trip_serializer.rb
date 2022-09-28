class RoadTripSerializer

  def self.format_road_trip(road_trip, weather_at_eta)
    {
      "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
          "origin": road_trip.origin,
          "destination": road_trip.destination,
          "travel_time": road_trip.travel_time,
          "weather_at_eta": {
            "temperature": weather_at_eta[:temperature],
            "conditions": weather_at_eta[:conditions]
          }
        }
      }
    }
  end
end
