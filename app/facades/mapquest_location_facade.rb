class MapquestLocationFacade
  def self.get_mapquest_location_data(location)
    json = MapquestService.get_location_data(location)
    results = json[:results][0][:locations]
    MapquestLocation.new(results)
  end
end
