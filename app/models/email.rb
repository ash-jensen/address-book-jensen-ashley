class Email < ApplicationRecord
  validates :email_address, presence: true
  belongs_to :person
end
