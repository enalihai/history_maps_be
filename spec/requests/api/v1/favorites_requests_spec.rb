require 'rails_helper'

RSpec.describe "Favorites API requests" do
  it "can create a favorite" do
    user = create(:user)
    fav_params = {  location: "123 Real Street, Denver, CO",
                    user_id: user.id }

    headers = { "CONTENT_TYPE" => "application/json" }

    post "/api/v1/favorites/new", headers: headers, params: JSON.generate(fav_params)

    response_body = JSON.parse(response.body, symbolize_names: true)
    favorites = response_body[:data]

    expect(response).to be_successful
    expect(response.status).to eq 201
    expect(favorites).to be_a Hash

    expect(favorites).to have_key :id
    expect(favorites[:id]).to be_a String

    expect(favorites).to have_key :type
    expect(favorites[:type]).to be_a String
    expect(favorites[:type]).to eq 'favorite'

    expect(favorites).to have_key :attributes
    expect(favorites[:attributes]).to be_a Hash

    expect(favorites[:attributes]).to have_key :location
    expect(favorites[:attributes]).to have_key :user_id
    expect(favorites[:attributes][:location]).to be_a String
    expect(favorites[:attributes][:user_id]).to be_a Integer
  end
end
