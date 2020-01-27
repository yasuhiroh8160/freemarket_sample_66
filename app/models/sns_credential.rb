class SnsCredential < ApplicationRecord
  belongs_to :user, optional: true
  validates :uid,presence: true
  validates :provider,presence: true
  validates :user_id,presence: true
end
