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
      
      body = JSON.parse(response.body, symbolize_names: true).
      

      expect(response).to be_successful
      expect(body).to have_key(:data)
      expect(body[:data].keys).to contain_exactly(:id, :type, :attributes)
      expect(body[:data][:attributes].keys).to contain_exactly(:email, :api_key)
    end
  end
end
