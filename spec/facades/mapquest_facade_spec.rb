require 'rails_helper'

RSpec.describe MapquestFacade do
  it 'returns a location poro with the city, state, lat, and lng', :vcr do
    location = MapquestFacade.create_coordinates('denver,co')

    expect(location).to be_a(Location)
    expect(location.city).to be_a(String)
    expect(location.state).to be_a(String)
    expect(location.lat).to be_a(Float)
    expect(location.lng).to be_a(Float)
  end
end
