class User < ApplicationRecord

  #Userモデルへ関連付け追加
  has_many :place, dependent: :destroy

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
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

    # 渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # 試作feedの定義
  def feed
      Place.where("user_id = ?", id)
  end
end
