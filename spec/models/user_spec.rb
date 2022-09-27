brequire 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    # it { should have_many(:api_keys) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_uniqueness_of(:email) }
  end
end
 