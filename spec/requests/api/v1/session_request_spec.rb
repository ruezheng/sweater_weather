require 'rails_helper'

RSpec.describe 'User Log In' do
  describe '#create' do
    context 'happy path' do
      it 'creates a new user session and returns 200 status when credentials are valid' do
        user = User.create!(email: 'user@example.com', password: 'test123')
        api_key = user.generate_api_key

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

    # context 'sad path' do
    #   it 'returns a 400 status error message if a field is missing' do
    #     params = {
    #       "email": 'user@example.com',
    #       "password": 'test123',
    #       "password_confirmation": ''
    #     }
        
    #     headers = {
    #       'Content-Type': 'application/json',
    #       'Accept': 'application/json'
    #     }

    #     post '/api/v1/users', headers: headers, params: JSON.generate(params)

    #     expect(response.status).to eq(400)
    #     expect(response.body).to eq("Password confirmation doesn't match Password")
    #   end  

    #   it 'returns a 400 status error message if password does not match password confirmation' do
    #     params = {
    #       "email": 'user@example.com',
    #       "password": 'test123',
    #       "password_confirmation": 'test12'
    #     }
        
    #     headers = {
    #       'Content-Type': 'application/json',
    #       'Accept': 'application/json'
    #     }

    #     post '/api/v1/users', headers: headers, params: JSON.generate(params)

    #     expect(response.status).to eq(400)
    #     expect(response.body).to eq("Password confirmation doesn't match Password")
    #   end

    #   it 'returns a 400 status error message if email is already taken' do
    #     # create user1:
    #     params = {
    #       "email": 'user@example.com',
    #       "password": 'test123',
    #       "password_confirmation": 'test123'
    #     }
        
    #     headers = {
    #       'Content-Type': 'application/json',
    #       'Accept': 'application/json'
    #     }

    #     post '/api/v1/users', headers: headers, params: JSON.generate(params)
    #     user1 = JSON.parse(response.body, symbolize_names: true)

    #     expect(response.status).to eq(201)
        
    #     # user2: fails to create new user
    #     params = {
    #       "email": 'user@example.com',
    #       "password": 'test123',
    #       "password_confirmation": 'test123'
    #     }
        
    #     headers = {
    #       'Content-Type': 'application/json',
    #       'Accept': 'application/json'
    #     }

    #     post '/api/v1/users', headers: headers, params: JSON.generate(params)

    #     expect(response.status).to eq(400)
    #     expect(response.body).to eq("Email has already been taken")
    #   end
    # end
  end
end
