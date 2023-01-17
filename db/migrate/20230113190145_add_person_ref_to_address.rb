class AddPersonRefToAddress < ActiveRecord::Migration[6.1]
  def change
    add_reference :addresses, :person, foreign_key: true
  end
end
