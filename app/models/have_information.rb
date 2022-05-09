class HaveInformation < ApplicationRecord
  belongs_to :user
  belongs_to :information
  validates :user_id, presence: true
  validates :information_id, presence: true
end
