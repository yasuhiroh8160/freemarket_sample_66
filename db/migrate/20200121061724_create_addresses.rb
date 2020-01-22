class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :zipcode,null: false
      t.string :prefecture,null: false
      t.string :city,null: false
      t.string :district,null: false
      t.string :building,null:false
      t.references :user
      t.timestamps
    end
  end
end
