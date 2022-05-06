class Information < ApplicationRecord
  validates :category,  presence: true, length: { maximum: 50 }
  validates :content,   presence: true, length: { maximum: 50 },
                        uniqueness: true
end

