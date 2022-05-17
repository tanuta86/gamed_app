class Tag < ApplicationRecord
  belongs_to :group
  belongs_to :information
  validates  :group_id,       presence: true
  validates  :information_id, presence: true  
end
