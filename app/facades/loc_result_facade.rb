class LocResultFacade
  def self.create_loc_index_results(location)
    json = LocService.get_location_collection_data(location)
    json[:results].map do |result|
      LocIndexResult.new(result)
    end
  end
end
