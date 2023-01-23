class AddPersonRefToPhoneNumber < ActiveRecord::Migration[6.1]
  def change
    add_reference :phone_numbers, :person, foreign_key: true
  end
end
