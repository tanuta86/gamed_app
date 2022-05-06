class Information < ApplicationRecord
  validates :category,  presence: true, length: { maximum: 50 }
  validates :category,  uniqueness: true, if: :category_played?
  validates :content,   presence: true, length: { maximum: 50 }

  def category_played?
    category == "played"
  end
  
end
                      

