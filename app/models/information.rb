class Information < ApplicationRecord
  has_many :tags,                 foreign_key: "information_id", 
                                  dependent:   :destroy
  has_many :groups, through: :tags
  
  has_many :have_informations,    foreign_key: "information_id",
                                  dependent:   :destroy  
  has_many :users, through: :have_informations    
  
  
  validates :category,  presence: true, length: { maximum: 50 }
  validates :content,  uniqueness: true, if: :category_played?
  validates :content,   presence: true, length: { maximum: 50 }

  def category_played?
    category == "played"
  end
  
end
                      

