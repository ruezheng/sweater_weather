class MapquestFacade
  def self.create_coordinates(location)
    location_data = MapquestService.get_coordinates(location)
    
    Location.new(location_data[0])
  end
  
  def self.create_travel_time(origin, destination)
    route_data = MapquestService.get_route(origin, destination)
    
    route_data[:formattedTime]
  end
end
