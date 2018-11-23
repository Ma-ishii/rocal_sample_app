class Place < ApplicationRecord
  belongs_to :user

  # Placeモデルへバリデーション追加
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :address, presence: true, length: { maximum: 140 }

  geocoded_by :name
  after_validation :geocode

  # デフォルトの順序付の設定
  default_scope -> { order(created_at: :desc) }


  #画像アップローダー
  mount_uploader :picture, PictureUploader

  private


  # アップロードされた画像のサイズをバリデーションする
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
