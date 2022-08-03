require 'rails_helper'

RSpec.describe LocItemResult do
  it "exists and has attributes" do
    data = { item: {  title: "Red Rocks",
                      other_titles: "Park of Red Rocks",
                      id: "co0994",
                      place: [ {  latitude: "39.665578",
                                  longitude: "-105.206856" } ],
                      notes: [ {  note: "Park Details" , label: "field label" },
                               {  note: "Second Details", label: "field label" } ],
                      link: "actual_loc_page_path",
                      resource_links: ["path_one", "path_two"],
                      service_medium: "some_link",
                      service_low: "some_other_link"  },
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
    expect(item.details).to eq([ {  note: "Park Details" , label: "field label" },
                                 {  note: "Second Details", label: "field label" } ])
    expect(item.photo_url).to eq("photo_path")
    expect(item.photo_large).to eq("large_photo_path")
    expect(item.photo_medium).to eq("medium_photo_path")
    expect(item.direct_link).to eq("actual_loc_page_path")
    expect(item.resource_links).to eq(["path_one", "path_two"])
    expect(item.service_medium).to eq("some_link")
    expect(item.service_low).to eq("some_other_link")
  end
end
