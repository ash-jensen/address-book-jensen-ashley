class Person < ApplicationRecord
  validates :first_name,:last_name, presence: true
  has_many :addresses
  belongs_to :user
end
