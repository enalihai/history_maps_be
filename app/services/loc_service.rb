class LocService
  def self.conn
    Faraday.new('https://www.loc.gov/')
  end

  def self.get_location_collection_data(location)
    end_point = 'pictures/search/'
    result = MapquestLocationFacade.get_mapquest_location_data(location)
    format = (result.county + " " + result.state).downcase
    response = conn.get(end_point) do |faraday|
      faraday.params['q'] = format
      faraday.params['co'] = 'hh'
      faraday.params['fo'] = 'json'
      faraday.params['sg'] = 'true'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_single_location_item_data(item_id)
    response = conn.get("pictures/collection/hh/item/#{item_id}/") do |faraday|
      faraday.params['fo'] = 'json'
    end
    JSON.parse(response.body, symbolize_names: true)

  end
end
