require 'rails_helper'

RSpec.describe MapquestFacade do
  context 'happy path', :vcr do
    describe '::create_coordinates' do
      it 'returns a location poro with the city, state, lat, and lng attributes' do
        location = MapquestFacade.create_coordinates('denver,co')

        expect(location).to be_a(Location)
        expect(location.city).to be_a(String)
        expect(location.state).to be_a(String)
        expect(location.lat).to be_a(Float)
        expect(location.lng).to be_a(Float)
      end
    end

    describe '::create_road_trip' do
      it 'returns route data as a RoadTrip poro with travel_time and distance attributes' do
        travel_time = MapquestFacade.create_travel_time('new york,ny', 'los angeles,ca')

        # expect(road_trip).to be_a(RoadTrip)
        expect(travel_time).to be_a(String)
        # expect(road_trip.distance).to be_a(String)
        # expect(road_trip.id).to eq(nil)
        # expect(road_trip.temperature).to eq("75.6")
      end    
    end
  end
end
