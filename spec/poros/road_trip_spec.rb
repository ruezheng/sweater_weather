require 'rails_helper'

RSpec.describe RoadTrip do
  it 'exists and has attributes', :vcr do
    response = JSON.parse(File.read('spec/fixtures/mapquest_route_response.json'), symbolize_names: true)
    route_data = response[:route][:legs][0]

    road_trip = RoadTrip.new('salt lake city, ut', 'new york, ny', route_data)

    expect(road_trip).to be_a(RoadTrip)
    expect(road_trip.id).to eq(nil)
    expect(road_trip.origin).to eq('Salt Lake City, UT')
    expect(road_trip.destination).to eq('New York, NY')
    expect(road_trip.travel_time).to eq('31 hours, 18 minutes')
  end
end
