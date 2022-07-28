require 'rails_helper'

RSpec.describe "Favorites API requests" do
  it "can create a favorite" do
    user = create(:user)
    fav_params = {  location: "123 Real Street, Denver, CO",
                    user_id: user.id }

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

    expect(favorites[:attributes]).to have_key :location
    expect(favorites[:attributes]).to have_key :user_id
    expect(favorites[:attributes][:location]).to be_a String
    expect(favorites[:attributes][:user_id]).to be_a Integer
  end

  it "sends all favorites of a user from an index endpoint" do
    user_1 = User.first
    fav_1 = Favorite.create!({  location: "123 Real Street, Denver, CO",
                                        user_id: user_1.id })
    fav_2 = Favorite.create!({  location: "123 Fake Road, Denver, CO",
                                        user_id: user_1.id })
    fav_3 = Favorite.create!({  location: "200 E Colfax Ave, Denver, CO",
                                        user_id: user_1.id })

    get "/api/v1/users/#{user_1.id}/favorites"

    response_body = JSON.parse(response.body, symbolize_names: true)
    favorites = response_body[:data]

    expect(response).to be_successful
    expect(favorites).to be_a Array

    favorites.each do |favorite|
      expect(favorite).to have_key :id
      expect(favorite[:id]).to be_a String

      expect(favorite).to have_key :type
      expect(favorite[:type]).to be_a String
      expect(favorite[:type]).to eq('favorite')

      expect(favorite).to have_key :attributes
      expect(favorite[:attributes]).to be_a Hash

      expect(favorite[:attributes]).to have_key :location
      expect(favorite[:attributes][:location]).to be_a String

      expect(favorite[:attributes]).to have_key :user_id
      expect(favorite[:attributes][:user_id]).to be_a Integer
      expect(favorite[:attributes][:user_id]).to eq(user_1.id)
     end
  end

  it "sends one favorite of a user from a show endpoint" do
    user_1 = User.first
    fav_1 = Favorite.create!({  location: "123 Real Street, Denver, CO",
                                        user_id: user_1.id })
    fav_2 = Favorite.create!({  location: "123 Fake Road, Denver, CO",
                                        user_id: user_1.id })
    fav_3 = Favorite.create!({  location: "200 E Colfax Ave, Denver, CO",
                                        user_id: user_1.id })

    get "/api/v1/users/#{user_1.id}/favorites/#{fav_1.id}"

    response_body = JSON.parse(response.body, symbolize_names: true)
    favorite = response_body[:data]

    expect(response).to be_successful
    expect(favorite).to be_a Hash

    expect(favorite).to have_key :id
    expect(favorite[:id]).to be_a String

    expect(favorite).to have_key :type
    expect(favorite[:type]).to be_a String
    expect(favorite[:type]).to eq('favorite')

    expect(favorite).to have_key :attributes
    expect(favorite[:attributes]).to be_a Hash

    expect(favorite[:attributes]).to have_key :location
    expect(favorite[:attributes][:location]).to be_a String

    expect(favorite[:attributes]).to have_key :user_id
    expect(favorite[:attributes][:user_id]).to be_a Integer
    expect(favorite[:attributes][:user_id]).to eq(user_1.id)
  end
end
