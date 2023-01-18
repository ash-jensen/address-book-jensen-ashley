class MakePhoneNumberNotNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :phone_numbers, :phone_number, false
  end
end
