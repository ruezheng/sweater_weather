require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    # it { should have_many(:api_keys) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_uniqueness_of(:email) }
  end

  describe 'instance methods' do
    describe '#generate_api_key' do
      it 'creates a new api key' do
        user = User.new({
                          "email": 'user@example.com',
                          "password": 'test123',
                          "password_confirmation": 'test123'
                        })

        expect(user.api_key).to eq(nil)

        user.generate_api_key

        expect(user.api_key).to be_a(String)
      end
    end
  end
end
