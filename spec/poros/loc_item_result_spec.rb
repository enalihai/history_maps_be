require 'rails_helper'

RSpec.describe LocItemResult do
  it "exists and has attributes" do
    data = { item: {  title: "Red Rocks",
                      other_titles: "Park of Red Rocks",
                      id: "co0994",
                      service_low: "//cdn.loc.gov/service/pnp/habshaer/co/co0000/co0004/photos/020850p_150px.jpg?q=co0004.photos.020850p&c=25&st=gallery",
                      place: [ {  latitude: "39.665578",
                                  longitude: "-105.206856" } ],
                      notes: [ {  note: "Park Details" } ] },
             resources: [ {  url: "photo_path",
                             large: "large_photo_path",
                             medium: "medium_photo_path" } ]
           }
    item = LocItemResult.new(data)

    # item_id = "co0004"
    # item = LocResultFacade.create_single_item_result(item_id)

    expect(item).to be_a LocItemResult
    expect(item.location_id).to eq("co0994")
    expect(item.title).to eq("Red Rocks")
    expect(item.other_titles).to eq("Park of Red Rocks")
    expect(item.lat).to eq("39.665578")
    expect(item.long).to eq("-105.206856")
    expect(item.details).to eq("Park Details")
    expect(item.photo_url).to eq("photo_path")
    expect(item.photo_large).to eq("large_photo_path")
    expect(item.photo_medium).to eq("medium_photo_path")
    expect(item.service_low).to eq("//cdn.loc.gov/service/pnp/habshaer/co/co0000/co0004/photos/020850p_150px.jpg?q=co0004.photos.020850p&c=25&st=gallery")
  end
end
