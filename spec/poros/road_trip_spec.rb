require 'rails_helper'

RSpec.describe RoadTrip do
  it 'exists and has attributes', :vcr do
    route_data = JSON.parse(File.read('spec/fixtures/mapquest_route_response.json'), symbolize_names: true)
    travel_time = route_data[:route][:legs][0][:maneuvers][0][:formattedTime]

    road_trip = RoadTrip.new('los angeles', 'new york, ny', travel_time)

    expect(road_trip).to be_a(RoadTrip)
    expect(road_trip.id).to eq(nil)
    # expect(road_trip.origin).to eq('Los Angeles,LOS ANGELES')
    expect(road_trip.destination).to eq('New York, NY')
    # expect(road_trip.travel_time).to eq('31 hours, 18 minutes')
  end
end
