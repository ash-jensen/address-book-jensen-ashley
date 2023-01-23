class Person < ApplicationRecord
  validates :first_name,:last_name, presence: true
  has_many :addresses
  has_many :emails
  has_many :phone_numbers
  belongs_to :user
end
