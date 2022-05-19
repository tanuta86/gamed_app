class Group < ApplicationRecord
  has_many :favorites,                 foreign_key: "group_id", 
                                       dependent:   :destroy 
                                  
  
  has_many :tags,    foreign_key: "group_id", dependent:   :destroy
  has_many :informations, through: :tags 
  
  belongs_to :user
  has_one_attached :image
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true  
  validates :name, presence: true, length: { maximum: 50 }
  validates :explanation, length: { maximum: 140 }

  
  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png],
                                      message: "must be a valid image format" },
                      size:         { less_than: 5.megabytes,
                                      message: "should be less than 5MB" }

  # 表示用のリサイズ済み画像を返す
  def display_image
    image.variant(resize_to_limit: [500, 500])
  end 
  
  # 情報を追加する
  def tag(information)
    informations << information
  end

  # 情報を削除する
  def untag(information)
    tags.find_by(information_id: information.id).destroy
  end

  # 現在のユーザーが情報に含まれていたらtrueを返す
  def tag?(information)
    informations.include?(information)
  end
end  
