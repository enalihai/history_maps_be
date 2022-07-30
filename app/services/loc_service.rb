class LocService
  def self.conn
    Faraday.new('http://www.loc.gov/')
  end

  def self.get_location_collection_data(location)
    end_point = 'pictures/search'
    result = MapquestLocationFacade.get_mapquest_location_data(location)
    format = (result.county + " " + result.state).downcase
    # mapquest_result = format.gsub("", " ")
    # mapquest_result = format_location_for_query(location)
    response = conn.get(end_point) do |faraday|
      faraday.params['q'] = format
      faraday.params['co'] = 'hh'
      faraday.params['fo'] = 'json'
    end
    require "pry"; binding.pry
    x = JSON.parse(response.body, symbolize_names: true)
  end
end
