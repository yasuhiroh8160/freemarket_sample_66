class Product < ApplicationRecord
  validates :name, :price, :description, :term_id, :size_id, :condition_id, :shipping_id, :delivery_id, :fromprefecture_id, :category_id,  presence: true
  has_many_attached :images

  validate :image_presence

  def image_presence
    if images.attached?
    else
      errors.add(:images, 'ファイルを添付してください')
    end
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
