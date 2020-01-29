class RemoveBirthmonthfromUsers < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :birth_month
  end

  def down
    add_column :users, :birth_month, :string
  end
end
