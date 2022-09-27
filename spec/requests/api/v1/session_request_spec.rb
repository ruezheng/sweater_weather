require 'rails_helper'

RSpec.describe 'User Log In' do
  describe '#create' do
    let!(:user) { User.create!(email: 'user@example.com', password: 'test123') }
    let!(:api_key) { user.generate_api_key }

    context 'happy path' do
      it 'creates a new user session and returns 200 status when credentials are valid' do
        params = {
          "email": 'user@example.com',
          "password": 'test123'
        }
        
        headers = {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        }
        
        post '/api/v1/sessions', headers: headers, params: JSON.generate(params)

        body = JSON.parse(response.body, symbolize_names: true)
        
        expect(response.status).to eq(200)
        expect(body).to have_key(:data)
        expect(body[:data].keys).to contain_exactly(:id, :type, :attributes)
        expect(body[:data][:attributes].keys).to contain_exactly(:email, :api_key)
      end
    end

    context 'sad path' do
      it 'returns a 400 status and error message if password is invalid' do
        params = {
          "email": 'user@example.com',
          "password": 'test12',
        }
        
        headers = {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        }

        post '/api/v1/sessions', headers: headers, params: JSON.generate(params)
        body = JSON.parse(response.body)

        expect(response.status).to eq(401)
        expect(body["error"]).to eq("Email or password is invalid. Please try again.")
      end

      # it 'returns a 400 status and error message if email is invalid' do
      #   # create user1:
      #   params = {
      #     "email": 'user@example.com',
      #     "password": 'test123',
      #     "password_confirmation": 'test123'
      #   }
        
      #   headers = {
      #     'Content-Type': 'application/json',
      #     'Accept': 'application/json'
      #   }

      #   post '/api/v1/users', headers: headers, params: JSON.generate(params)
      #   user1 = JSON.parse(response.body, symbolize_names: true)

      #   expect(response.status).to eq(201)
        
      #   # user2: fails to create new user
      #   params = {
      #     "email": 'user@example.com',
      #     "password": 'test123',
      #     "password_confirmation": 'test123'
      #   }
        
      #   headers = {
      #     'Content-Type': 'application/json',
      #     'Accept': 'application/json'
      #   }

      #   post '/api/v1/users', headers: headers, params: JSON.generate(params)

      #   expect(response.status).to eq(400)
      #   expect(response.body).to eq("Email has already been taken")
      # end
    end
  end
end
