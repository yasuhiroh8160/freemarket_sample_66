class Product < ApplicationRecord
  belongs_to :user
  belongs_to :brand
  belongs_to :term
  belongs_to :size
  belongs_to :condition
  belongs_to :shipping
  belongs_to :delivery
  belongs_to :fromprefecture
  belongs_to :category 
end
