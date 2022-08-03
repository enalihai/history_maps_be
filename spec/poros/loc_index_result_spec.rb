require 'rails_helper'

RSpec.describe LocIndexResult do
  it "exists and has attributes" do
    data = {  title: "Result Item 1",
              links: {:item=>"https://www.loc.gov/pictures/collection/hh/item/co0994/"},
              pk: "co0994.photos.XXXXXXp",
              image: {  full: "full_image_url",
                        thumb: "thumb_thumb_url"  },
              creator: "Lowe, Jet",
              created_published_date: "1993",
              index: 1  }
    result = LocIndexResult.new(data)

    expect(result).to be_a LocIndexResult
    expect(result.title).to eq("Result Item 1")
    expect(result.collection_link).to eq("https://www.loc.gov/pictures/collection/hh/item/co0994/")
    expect(result.full_id).to eq("co0994.photos.XXXXXXp")
    expect(result.short_id).to eq("co0994")
    expect(result.image_full).to eq("full_image_url")
    expect(result.image_thumbnail).to eq("thumb_thumb_url")
    expect(result.creator).to eq("Lowe, Jet")
    expect(result.published_date).to eq("1993")
  end
end
