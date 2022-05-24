class Micropost < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_one_attached :image
  default_scope -> { order(created_at: :desc) }
  validates :user_id,  presence: true
  validates :group_id, presence: true
  validates :content,  presence: true, length: { maximum: 1000 }
end