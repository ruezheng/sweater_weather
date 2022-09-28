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

    describe '::create_route' do
      it 'returns route data as a RoadTrip poro with travel_time and distance attributes' do
        route = MapquestFacade.create_route('salt lake city,ut', 'new york,ny')

        expect(route).to be_a(RoadTrip)
        expect(route.travel_time).to be_a(String)
        expect(route.distance).to be_a(String)
      end    
    end
  end
end
