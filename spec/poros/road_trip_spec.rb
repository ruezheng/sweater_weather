require 'rails_helper'

RSpec.describe RoadTrip do
  it 'exists and has attributes' do
    weather_at_eta = {
      "temperature": 75.5,
      "conditions": 'not a cloud in the sky'
    }

    road_trip = RoadTrip.new('salt lake city, ut', 'new york, ny', '33', weather_at_eta)

    expect(road_trip).to be_a(RoadTrip)

    expect(road_trip.id).to eq(nil)
    expect(road_trip.start_city).to eq('Salt Lake City, UT')
    expect(road_trip.end_city).to eq('New York, NY')
    expect(road_trip.travel_time).to be_a('33 hrs')
    expect(road_trip.weather_at_eta).to eq(
      {
        "temperature": 75.5,
        "conditions": 'not a cloud in the sky'
      })
  end

  # xit 'returns even with impossible route' do
  #   weather_at_eta = nil
  #   travel_time = 'impossible route'

  #   road_trip = RoadTrip.new('denver,co', 'Hawaii', travel_time, weather_at_eta)

  #   expect(road_trip).to be_a RoadTrip

  #   expect(road_trip.id).to eq nil
  #   expect(road_trip.start_city).to be_a String
  #   expect(road_trip.start_city).to eq 'denver,co'
  #   expect(road_trip.end_city).to be_a String
  #   expect(road_trip.end_city).to eq 'Hawaii'
  #   expect(road_trip.travel_time).to be_a String
  #   expect(road_trip.travel_time).to eq 'impossible route'
  #   expect(road_trip.weather_at_eta).to eq nil
  # end
end