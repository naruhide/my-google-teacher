class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :word, presence: true, length: { maximum: 50 }
  validates :comment, presence: true, length: { maximum: 255 }
  
end
