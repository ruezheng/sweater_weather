class MapquestFacade
  def self.create_coordinates(location)
    parsed_json = MapquestService.get_coordinates(location)
    
    Location.new(parsed_json[0])
  end
end
