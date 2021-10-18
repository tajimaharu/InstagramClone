class User < ApplicationRecord
  before_validation { email.downcase! }
  has_many :instaclones
  has_many :favorites, dependent: :destroy
  mount_uploader :image, ImageUploader
  has_secure_password
  validates :password, length: {minimum: 6 }, if: :has_password_digest
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: {maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
        def has_password_digest
          self.password_digest.empty?
        end
end
