require 'rails_helper'

RSpec.describe "API/V1/Users/user_id" do
  describe 'Requests' do
    it "POST /favorites :: creates a favorite" do
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

    it "GET /favorites :: returns a specific users favorites index" do
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

    it "GET /favorites/fav_id :: returns a specific favorite of a user" do
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
  end

  describe 'EDGECASE::SADPATH' do
    it "GET /favorites/fav_id :: No favorite found by ID" do
      user = create(:user)
      user_2 = create(:user)
      create_list(:favorite, 3, user_id: user.id)
      create_list(:favorite, 6, user_id: user_2.id)

      get "/api/v1/users/#{user.id}/favorites/4"
      
      expect(response.status).to eq(404)
      expect(response.code).to eq("404")
      expect(response.message).to eq("Not Found")
    end
  end
end