require 'rails_helper'

RSpec.describe "API/V1/Users" do
  describe 'Requests' do
    it "POST /register :: creates a user" do
      user_params = { username: 'bigboy',
                      email: 'suchemail@email.com' }

      headers = { "CONTENT_TYPE" => "application/json" }

      post "/api/v1/users/register", headers: headers, params: JSON.generate(user_params)

      response_body = JSON.parse(response.body, symbolize_names: true)
      user = response_body[:data]

      expect(response).to be_successful
      expect(response.status).to eq 201
      expect(user).to be_a Hash

      expect(user).to have_key :id
      expect(user[:id]).to be_a String

      expect(user).to have_key :type
      expect(user[:type]).to be_a String
      expect(user[:type]).to eq 'user'

      expect(user).to have_key :attributes
      expect(user[:attributes]).to be_a Hash

      expect(user[:attributes]).to have_key :email
      expect(user[:attributes]).to have_key :username
      expect(user[:attributes][:email]).to be_a String
      expect(user[:attributes][:username]).to be_a String
    end

    it "GET /users :: returns all users" do
      create_list(:user, 5)
      get '/api/v1/users'

      response_body = JSON.parse(response.body, symbolize_names: true)
      users = response_body[:data]

      expect(response).to be_successful
      expect(users).to be_a Array

      users.each do |user|
        expect(user).to have_key :id
        expect(user[:id]).to be_a String

        expect(user).to have_key :type
        expect(user[:type]).to be_a String
        expect(user[:type]).to eq('user')

        expect(user).to have_key :attributes
        expect(user[:attributes]).to be_a Hash

        expect(user[:attributes]).to have_key :username
        expect(user[:attributes][:email]).to be_a String

        expect(user[:attributes]).to have_key :email
        expect(user[:attributes][:username]).to be_a String
      end
    end

    it "GET /user_id :: returns a specific user" do
      user_1 = create(:user)

      get "/api/v1/users/#{user_1.id}"

      response_body = JSON.parse(response.body, symbolize_names: true)
      user = response_body[:data]

      expect(response).to be_successful
      expect(user).to be_a Hash

      expect(user).to have_key :id
      expect(user[:id]).to be_a String

      expect(user).to have_key :type
      expect(user[:type]).to be_a String
      expect(user[:type]).to eq('user')

      expect(user).to have_key :attributes
      expect(user[:attributes]).to be_a Hash

      expect(user[:attributes]).to have_key :email
      expect(user[:attributes][:email]).to be_a String

      expect(user[:attributes]).to have_key :username
      expect(user[:attributes][:username]).to be_a String
    end
  end

  describe 'EDGECASE::SADPATH' do
    it "GET /users/user_id ::  No user is found" do
      user = User.create({ email: 'fakeemail@email.com',
                          username: 'RealUser',
                          id: 1 })

      get "/api/v1/users/2"

      expect(response.status).to eq(404)
      expect(response.code).to eq("404")
      expect(response.message).to eq("Not Found")
    end
  end
end
