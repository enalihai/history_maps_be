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
              :photo_small,
              :resource_links,
              :direct_link,
              :service_medium,
              :service_low

  def initialize(data)
    @title = data[:item][:title]
    @other_titles = data[:item][:other_titles]
    @location_id = data[:item][:id]
    @lat = data[:item][:place][0][:latitude]
    @long = data[:item][:place][0][:longitude]
    @details = all_details(data)
    @resource_links = all_resource_links(data)
    @direct_link = data[:item][:link]
    @service_medium = data[:item][:service_medium]
    @service_low = data[:item][:service_low]

    @photo_url = data[:resources][0][:url]
    @photo_medium = data[:resources][0][:medium]
    @photo_large = data[:resources][0][:large]
    @photo_small = data[:resources][0][:small]
  end

  def all_details(data)
    details = []
    data[:item][:notes].each do |note|
      details << note
    end
    details
  end

  def all_resource_links(data)
    resources = []
    data[:item][:resource_links].each do |link|
      resources << link
    end
    resources
  end
end
