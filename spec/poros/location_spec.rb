require 'rails_helper'

describe Location do
  it "returns location object from JSON response with city, state, and coordinates as attributes" do
    response = JSON.parse(File.read('spec/fixtures/mapquest_response.json'), symbolize_names: true)
    data =  response[:results][0][:locations][0]

    location = Location.new(data)
    
    expect(location).to be_a(Location)
    expect(location.city).to eq('Denver')
    expect(location.state).to eq('CO')
    expect(location.lat).to eq(39.738453)
    expect(location.lng).to eq(-104.984853)
  end
end
