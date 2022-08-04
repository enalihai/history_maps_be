require 'rails_helper'

RSpec.describe "Favorites API requests" do
  it "can create a favorite" do
    user = create(:user)
    fav_params = {  title: "123 Real Street, Denver, CO",
                    image_full: "img_path_string",
                    short_id: "short_id_path",
                    published_date: "some_date",
                    creator: "some_creator",
                    thumbnail: "some_thumbnail_path" }

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
    expect(favorites[:attributes][:user_id]).to eq(user.id)

    expect(favorites[:attributes]).to have_key :title
    expect(favorites[:attributes][:title]).to be_a String

    expect(favorites[:attributes]).to have_key :image_full
    expect(favorites[:attributes][:image_full]).to be_a String

    expect(favorites[:attributes]).to have_key :short_id
    expect(favorites[:attributes][:short_id]).to be_a String

    expect(favorites[:attributes]).to have_key :published_date
    expect(favorites[:attributes][:published_date]).to be_a String

    expect(favorites[:attributes]).to have_key :creator
    expect(favorites[:attributes][:creator]).to be_a String

    expect(favorites[:attributes]).to have_key :thumbnail
    expect(favorites[:attributes][:thumbnail]).to be_a String
  end

  it "sends all favorites of a user from an index endpoint" do
    user = create(:user)
    create_list(:favorite, 6, user_id: user.id)

    get "/api/v1/users/#{user.id}/favorites"

    response_body = JSON.parse(response.body, symbolize_names: true)
    
    favorites = response_body[:data]

    expect(response).to be_successful
    expect(favorites).to be_a Array

    favorites.each do |favorite|
      expect(favorite).to have_key :id
      expect(favorite[:id]).to be_a String

      expect(favorite).to have_key :type
      expect(favorite[:type]).to be_a String
      expect(favorite[:type]).to eq 'favorite'

      expect(favorite).to have_key :attributes
      expect(favorite[:attributes]).to be_a Hash

      expect(favorite[:attributes]).to have_key :user_id
      expect(favorite[:attributes][:user_id]).to be_a Integer

      expect(favorite[:attributes]).to have_key :title
      expect(favorite[:attributes][:title]).to be_a String

      expect(favorite[:attributes]).to have_key :image_full
      expect(favorite[:attributes][:image_full]).to be_a String

      expect(favorite[:attributes]).to have_key :short_id
      expect(favorite[:attributes][:short_id]).to be_a String

      expect(favorite[:attributes]).to have_key :published_date
      expect(favorite[:attributes][:published_date]).to be_a String

      expect(favorite[:attributes]).to have_key :creator
      expect(favorite[:attributes][:creator]).to be_a String

      expect(favorite[:attributes]).to have_key :thumbnail
      expect(favorite[:attributes][:thumbnail]).to be_a String
     end
  end

  it "sends one favorite of a user from a show endpoint" do
    user = create(:user)
    create_list(:favorite, 6, user_id: user.id)
    fav_id = user.favorites.first.id
    
    get "/api/v1/users/#{user.id}/favorites/#{fav_id}"
    
    response_body = JSON.parse(response.body, symbolize_names: true)
    favorite = response_body[:data]
    
    expect(response).to be_successful
    expect(favorite).to be_a Hash

    expect(favorite).to have_key :id
    expect(favorite[:id]).to be_a String

    expect(favorite).to have_key :type
    expect(favorite[:type]).to be_a String
    expect(favorite[:type]).to eq 'favorite'

    expect(favorite).to have_key :attributes
    expect(favorite[:attributes]).to be_a Hash

    expect(favorite).to have_key :id
    expect(favorite[:id]).to be_a String

    expect(favorite).to have_key :type
    expect(favorite[:type]).to be_a String
    expect(favorite[:type]).to eq 'favorite'

    expect(favorite).to have_key :attributes
    expect(favorite[:attributes]).to be_a Hash

    expect(favorite[:attributes]).to have_key :user_id
    expect(favorite[:attributes][:user_id]).to be_a Integer

    expect(favorite[:attributes]).to have_key :title
    expect(favorite[:attributes][:title]).to be_a String

    expect(favorite[:attributes]).to have_key :image_full
    expect(favorite[:attributes][:image_full]).to be_a String

    expect(favorite[:attributes]).to have_key :short_id
    expect(favorite[:attributes][:short_id]).to be_a String

    expect(favorite[:attributes]).to have_key :published_date
    expect(favorite[:attributes][:published_date]).to be_a String

    expect(favorite[:attributes]).to have_key :creator
    expect(favorite[:attributes][:creator]).to be_a String

    expect(favorite[:attributes]).to have_key :thumbnail
    expect(favorite[:attributes][:thumbnail]).to be_a String
  end

  xit "sends an error if a favorite is not found" do
    user = create(:user)
    fav_1 = Favorite.create!( {   title: "123 Real Street, Denver, CO",
                                  user_id: user.id,
                                  other_titles: "More Cool Names",
                                  pdf: "pdf_path_1",
                                  photo: "photo_path_1",
                                  details: "Some Cool notes about the thing",
                                  location_id: "coXXXX",
                                  } )

    get "/api/v1/users/#{user.id}/favorites/2"
    
    expect(response.status).to eq(404)
    expect(response.code).to eq("404")
    expect(response.message).to eq("Not Found")
  end

  xit "can create a favorite" do
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
