require 'rails_helper'

RSpec.describe "Favorites API requests" do
  it "can create a favorite" do
    user = create(:user)
    fav_params = {  title: "123 Real Street, Denver, CO",
                    user_id: user.id,
                    other_titles: "More Cool Names",
                    pdf: "pdf_path",
                    photo: "photo_path",
                    details: "Cool notes about the thing",
                    location_id: "coXXXX" }

    headers = { "CONTENT_TYPE" => "application/json" }

    post "/api/v1/users/#{user.id}/favorites", headers: headers, params: JSON.generate(fav_params)

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

    expect(favorites[:attributes]).to have_key :user_id
    expect(favorites[:attributes][:user_id]).to be_a Integer

    expect(favorites[:attributes]).to have_key :location_id
    expect(favorites[:attributes][:location_id]).to be_a String

    expect(favorites[:attributes]).to have_key :title
    expect(favorites[:attributes][:title]).to be_a String

    expect(favorites[:attributes]).to have_key :other_titles
    expect(favorites[:attributes][:other_titles]).to be_a String

    expect(favorites[:attributes]).to have_key :details
    expect(favorites[:attributes][:details]).to be_a String

    expect(favorites[:attributes]).to have_key :photo
    expect(favorites[:attributes][:photo]).to be_a String

    expect(favorites[:attributes]).to have_key :pdf
    expect(favorites[:attributes][:pdf]).to be_a String
  end
end
