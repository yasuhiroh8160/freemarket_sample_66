class Product < ApplicationRecord
  validates :name, :price, :description, :term_id, :size_id, :condition_id, :shipping_id, :delivery_id, :fromprefecture_id, :category_id, :user_id,  presence: true
  has_many_attached :images, dependent: :destroy

  validate :image_presence

  def image_presence
    images.attached?
  end

  belongs_to :user, optional: true
  belongs_to :brand, optional: true
  belongs_to :term, optional: true
  belongs_to :size, optional: true
  belongs_to :condition, optional: true
  belongs_to :shipping, optional: true
  belongs_to :delivery, optional: true
  belongs_to :fromprefecture, optional: true
  belongs_to :category, optional: true
end
