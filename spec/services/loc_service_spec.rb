require 'rails_helper'

RSpec.describe LocService do
  it 'establish a base connection' do
    connection = LocService.conn

    expect(connection.class).to eq(Faraday::Connection)
  end

  it "returns a collection of results from an endpoint" do
    results = LocService.get_location_collection_data('80033')

    expect(results).to be_a Hash
  end
end
