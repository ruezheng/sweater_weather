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
      binding.pry
      
      body = JSON.parse(response.body)
      expect(response).to be_successful
      expect(response.status).to eq(201)
      
      expect(body).to have_key(:data)
      expect(body[:data].keys).to contain_exactly(:type, :id, :attributes)
      expect(body[:data][:attributes].keys).to contain_exactly(:email, :api_key)
    end
  end
end
