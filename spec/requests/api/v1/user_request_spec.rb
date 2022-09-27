require 'rails_helper'

RSpec.describe 'User Registration' do
  context 'happy path' do
    it 'creates a new user' do
      params = {
        "email": 'user@example.com',
        "password": 'test123',
        "password_confirmation": 'test123'
      }
      
      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }
      
      post '/api/v1/users', headers: headers, params: JSON.generate(params)
      
      body = JSON.parse(response.body, symbolize_names: true)
      
      expect(response).to have_http_status(:created)
      expect(response.status).to eq(201)
      expect(body).to have_key(:data)
      expect(body[:data].keys).to contain_exactly(:id, :type, :attributes)
      expect(body[:data][:attributes].keys).to contain_exactly(:email, :api_key)
    end
  end

  context 'sad path' do
    it 'returns a 400 status error message if password does not match password confirmation' do
      params = {
        "email": 'user@example.com',
        "password": 'test123',
        "password_confirmation": 'test12'
      }
      
      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

      post '/api/v1/users', headers: headers, params: JSON.generate(params)
      
      expect(response.status).to eq(400)
      expect(response.body).to eq("Password confirmation doesn't match Password")
    end
  end
end
