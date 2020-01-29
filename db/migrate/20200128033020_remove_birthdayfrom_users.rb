class RemoveBirthdayfromUsers < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :birth_day
  end

  def down
    add_column :users, :birth_day, :string
  end
end
