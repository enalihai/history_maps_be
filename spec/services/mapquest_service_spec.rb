require 'rails_helper'

RSpec.describe MapquestService do
  it 'returns a location' do
    location = MapquestService.get_location_data('200 East Colfax, denver, CO-80203')

    expect(location).to be_a(Hash)

    expect(location).to have_key(:results)

    expect(location[:results].first).to have_key(:locations)

    expect(location[:results].first[:locations].first).to have_key(:street)

    expect(location[:results].first[:locations].first).to have_key(:adminArea5)
    expect(location[:results].first[:locations].first[:adminArea5]).to be_a(String)

    expect(location[:results].first[:locations].first).to have_key(:adminArea4)
    expect(location[:results].first[:locations].first[:adminArea4]).to be_a(String)

    expect(location[:results].first[:locations].first).to have_key(:adminArea3)
    expect(location[:results].first[:locations].first[:adminArea3]).to be_a(String)

    expect(location[:results].first[:locations].first).to have_key(:postalCode)
    expect(location[:results].first[:locations].first[:postalCode]).to be_a(String)

  end

  it 'establish a base connection' do
    connection = MapquestService.connection
      expect(connection.class).to eq(Faraday::Connection)
  end
end
