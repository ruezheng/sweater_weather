class RoadTripSerializer

  def self.format_road_trip(trip_data)
    {
      "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
          "origin": road_trip.origin,
          "destination": road_trip.destination,
          "travel_time": road_trip.travel_time,
          "weather_at_eta": {
            "temperature": 59.4,
            "conditions": "partly cloudy with a chance of meatballs"
          }
        }
      }
    }
  end
end
