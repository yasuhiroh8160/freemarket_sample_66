class CreateFromprefectures < ActiveRecord::Migration[5.2]
  def change
    create_table :fromprefectures do |t|
      t.string :name

      t.timestamps
    end
  end
end
