class Micropost < ApplicationRecord
  belongs_to :user
  belongs_to :group
  
  if Rails.env.production?
    has_one_attached :image, service: :s3
  else  
    has_one_attached :image
  end

  default_scope -> { order(created_at: :desc) }
  validates :user_id,  presence: true
  validates :group_id, presence: true
  validates :content,  presence: true, length: { maximum: 1000 }
  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png image/jpg],
                                      message: "must be a valid image format" },
                      size:         { less_than: 5.megabytes,
                                      message: "should be less than 5MB" }
  def display_image
    image.variant(resize_to_limit: [500, 500])
  end
end
