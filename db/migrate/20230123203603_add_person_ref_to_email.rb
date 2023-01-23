class AddPersonRefToEmail < ActiveRecord::Migration[6.1]
  def change
    add_reference :emails, :person, foreign_key: true
  end
end
