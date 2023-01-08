class MakeFirstLastNotNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :people, :first_name, false
    change_column_null :people, :last_name, false
  end
end
