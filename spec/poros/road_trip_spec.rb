require 'rails_helper'

RSpec.describe RoadTrip do
  it 'exists and has attributes' do
    response = JSON.parse(File.read('spec/fixtures/mapquest_route_response.json'), symbolize_names: true)
    route_data =  response[:route][:legs][0]

    weather_at_eta = {
      "temperature": 75.5,
      "conditions": 'not a cloud in the sky'
    }

    road_trip = RoadTrip.new('salt lake city, ut', 'new york, ny', route_data)

    expect(road_trip).to be_a(RoadTrip)
    expect(road_trip.id).to eq(nil)
    expect(road_trip.origin).to eq('Salt Lake City, UT')
    expect(road_trip.destination).to eq('New York, NY')
    expect(road_trip.travel_time).to eq('31 hours, 18 minutes')
    # expect(road_trip.weather_at_eta).to eq({
      #   "temperature": 75.5,
      #   "conditions": 'not a cloud in the sky'
      # })
  end

  # xit 'returns even with impossible route' do
  #   weather_at_eta = nil
  #   travel_time = 'impossible route'

  #   road_trip = RoadTrip.new('denver,co', 'Hawaii', travel_time, weather_at_eta)

  #   expect(road_trip).to be_a RoadTrip

  #   expect(road_trip.id).to eq nil
  #   expect(road_trip.origin).to be_a String
  #   expect(road_trip.origin).to eq 'denver,co'
  #   expect(road_trip.destination).to be_a String
  #   expect(road_trip.destination).to eq 'Hawaii'
  #   expect(road_trip.travel_time).to be_a String
  #   expect(road_trip.travel_time).to eq 'impossible route'
  #   expect(road_trip.weather_at_eta).to eq nil
  # end
end
