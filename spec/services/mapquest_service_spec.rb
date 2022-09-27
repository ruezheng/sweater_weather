require 'rails_helper'

RSpec.describe MapquestService do
  context 'happy path', :vcr do
    it "returns geocode data to a user based on city and state" do
      data = MapquestService.get_coordinates("Denver,CO")

      expect(data).to be_an(Array)
      expect(data[0][:adminArea5]).to eq('Denver')
      expect(data[0][:adminArea3]).to eq('CO')
      expect(data[0]).to have_key(:latLng)
      expect(data[0][:latLng]).to eq({ "lat": 39.738453, "lng": -104.984853 })
    end
  end
end
