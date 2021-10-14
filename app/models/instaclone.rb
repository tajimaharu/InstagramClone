class Instaclone < ApplicationRecord
  validates :image, presence: true, unless: :content?
  validates :content, presence: true, unless: :image?
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
end
