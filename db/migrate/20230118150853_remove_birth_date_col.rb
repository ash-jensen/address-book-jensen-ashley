class RemoveBirthDateCol < ActiveRecord::Migration[6.1]
  def change
    remove_column :people, :birth_date, :string
  end
end
