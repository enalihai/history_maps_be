require 'rails_helper'

RSpec.describe MapquestLocation do
  it "exists and has attributes" do
    data = {:results=>
            [:locations=>
               [{:street=>"200 E Colfax Ave",
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
            ]}
    location = MapquestLocation.new(data)

    expect(location).to be_a MapquestLocation
    expect(location.street).to eq('200 E Colfax Ave')
    expect(location.county).to eq('Denver')
    expect(location.city).to eq('Denver')
    expect(location.state).to eq('CO')
    expect(location.zipcode).to eq('80203')
  end
end
