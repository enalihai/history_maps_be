require 'rails_helper'

RSpec.describe MapquestLocationFacade do
  it "gets location data" do
    location = MapquestLocationFacade.get_mapquest_location_data('200 E Colfax Ave')

    expect(location).to be_a MapquestLocation
    expect(location.street).to eq("200 E Colfax Ave")
  end
end
