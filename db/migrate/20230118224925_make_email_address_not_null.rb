class MakeEmailAddressNotNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :emails, :email_address, false
  end
end
