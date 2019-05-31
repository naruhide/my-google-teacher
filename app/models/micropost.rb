class Micropost < ApplicationRecord
  mount_uploader :micropost_image, MicropostImageUploader
  belongs_to :user
  
  validates :word, presence: true, length: { maximum: 50 }
  validates :comment, presence: true, length: { maximum: 255 }
  
  has_many :favorites, foreign_key: 'micropost_id', dependent: :destroy
  has_many :users, through: :favorites
  
end
