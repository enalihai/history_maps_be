require 'rails_helper'

RSpec.describe 'Location Search Requests' do
  it "determines a location based on search" do
    # location_1 = create(:mapquest_location, street: '200 E Colfax Ave')
    data = [{:street=>"200 E Colfax Ave",
             :adminArea6=>"",
             :adminArea6Type=>"Neighborhood",
             :adminArea5=>"Denver",
             :adminArea5Type=>"City",
             :adminArea4=>"Denver",
             :adminArea4Type=>"County",
             :adminArea3=>"CO",
             :adminArea3Type=>"State",
             :adminArea1=>"US",
             :adminArea1Type=>"Country",
             :postalCode=>"80203-1701"}]
   location_1 = MapquestLocation.new(data)

    get '/api/v1/search?location=colfax'

    location = JSON.parse(response.body, symbolize_names: true)
    # response_body = JSON.parse(response.body, symbolize_names: true)
    # location = response_body

    # require "pry"; binding.pry
    expect(response.status).to eq(200)
    expect(location).to be_a Hash
  end
end
