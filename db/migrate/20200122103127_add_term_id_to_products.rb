class AddTermIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :term, foreign_key: true
  end
end
