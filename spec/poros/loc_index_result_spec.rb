require 'rails_helper'

RSpec.describe LocIndexResult do
  it "exists and has attributes" do
    data = {  title: "Result Item 1",
              links: {:item=>"https://www.loc.gov/pictures/collection/hh/item/co0994/"},
              pk: "co0994"  }
    result = LocIndexResult.new(data)

    expect(result).to be_a LocIndexResult
    expect(result.title).to eq("Result Item 1")
    expect(result.collection_link).to eq("https://www.loc.gov/pictures/collection/hh/item/co0994/")
    expect(result.id).to eq("co0994")
  end
end
