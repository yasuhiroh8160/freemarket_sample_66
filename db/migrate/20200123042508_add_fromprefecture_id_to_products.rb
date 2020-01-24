class AddFromprefectureIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :fromprefecture, foreign_key: true
  end
end
