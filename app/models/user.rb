class User < ApplicationRecord
  has_secure_password
  has_one :rating

  validates :email, presence: true, uniqueness: true
  validates :login, presence: true, format: { with: /\A[a-zA-Z_0-9]+\z/ }
  validates :password, presence: true, length: { minimum: 8 }
end
