class User < ApplicationRecord
  has_secure_password
  validates :email, :password, presence: true
  has_many :people
end