class User < ApplicationRecord
  before_save { self.email = email.downcase }
  # 名前設定
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # メール設定
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  # パスワード設定
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
