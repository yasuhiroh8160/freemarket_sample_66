class RemoveBirthyearfromUsers < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :birth_year
  end

  def down
    add_column :users, :birth_year, :string
  end
end
