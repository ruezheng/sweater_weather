class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates_presence_of :password_digest

  has_secure_password

  # has_secure_token
  # has_secure_token :auth_token, length: 36
  # User.generate_unique_secure_token

  def generate_api_key
    self.api_key = SecureRandom.hex
  end
end
