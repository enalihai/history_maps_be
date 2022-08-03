require 'rails_helper'

RSpec.describe LocResultFacade do
  it "gets index results from a location service" do
    results = LocResultFacade.create_loc_index_results('80033')

    expect(results).to be_a Array
    expect(results).to be_all LocIndexResult
  end

  it "creates a single item object" do
    result = LocResultFacade.create_single_item_result('co0994')

    expect(result).to be_a LocItemResult
  end
end
