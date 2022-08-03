require 'rails_helper'

RSpec.describe LocService do
  it 'establish a base connection' do
    connection = LocService.conn

    expect(connection.class).to eq(Faraday::Connection)
  end

  it "returns a collection of results from an endpoint" do
    results = LocService.get_location_collection_data('80033')

    expect(results).to be_a Hash
    expect(results).to have_key :results
    expect(results[:results]).to be_a Array

    expect(results[:results][0]).to have_key :pk
    expect(results[:results][0]).to have_key :title
    expect(results[:results][0]).to have_key :image
    expect(results[:results][0][:image]).to have_key :full
    expect(results[:results][0][:image]).to have_key :thumb
    expect(results[:results][0]).to have_key :links
    expect(results[:results][0][:links]).to have_key :item
    expect(results[:results][0]).to have_key :creator
    expect(results[:results][0]).to have_key :created_published_date
  end

  it "returns a single result from an index" do
    result = LocService.get_single_location_item_data('co0994')

    expect(result).to be_a Hash
    expect(result).to have_key :item
    expect(result[:item]).to have_key :title
    expect(result[:item]).to have_key :other_titles
    expect(result[:item]).to have_key :id
    expect(result[:item]).to have_key :place
    expect(result[:item][:place][0]).to have_key :latitude
    expect(result[:item][:place][0]).to have_key :longitude
    expect(result[:item]).to have_key :notes
    expect(result[:item][:notes][0]).to have_key :note
    expect(result[:item]).to have_key :link
    expect(result[:item]).to have_key :resource_links

    expect(result).to have_key :resources
    expect(result[:resources][0]).to have_key :url
    expect(result[:resources][0]).to have_key :medium
    expect(result[:resources][0]).to have_key :large
  end
end
