class ChangeEmailName < ActiveRecord::Migration[6.1]
  def change
    rename_column :emails, :email, :email_address
  end
end
