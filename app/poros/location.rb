class Location
  attr_reader :city,
              :state,
              :lat,
              :lng

  def initialize(data)
    @city = data[:adminArea5]
    @state = data[:adminArea3]
    @lat = data[:latLng][:lat]
    @lng = data[:latLng][:lng]
  end
end
