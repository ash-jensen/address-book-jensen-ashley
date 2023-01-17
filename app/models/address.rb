class Address < ApplicationRecord
  validates :street, :town, :zip_code, presence: true
  belongs_to :person
end
