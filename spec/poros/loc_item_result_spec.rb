require 'rails_helper'

RSpec.describe LocItemResult do
  it "exists and has attributes" do
    data = { item: {  title: "Red Rocks",
                      other_titles: "Park of Red Rocks",
                      id: "co0994",
                      place: [ {  latitude: "39.665578",
                                  longitude: "-105.206856" } ],
                      notes: [ {  note: "Park Details" } ] },
             resources: [ {  url: "photo_path",
                             large: "large_photo_path",
                             medium: "medium_photo_path" } ]
           }
    item = LocItemResult.new(data)

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
  end
end
