class LocItemResult

  attr_reader :title,
              :other_titles,
              :location_id,
              :lat,
              :long,
              :details,
              :photo_url,
              :photo_large,
              :photo_medium,
              :service_low

  def initialize(data)
    @title = data[:item][:title]
    @other_titles = data[:item][:other_titles]
    @location_id = data[:item][:id]
    @service_low = data[:item][:service_low]
    @lat = data[:item][:place][0][:latitude]
    @long = data[:item][:place][0][:longitude]
    @details = data[:item][:notes][0][:note]
    @photo_url = data[:resources][0][:url]
    @photo_medium = data[:resources][0][:medium]
    @photo_large = data[:resources][0][:large]
  end
end
