class Item < ApplicationRecord
  belongs_to :user
  has_many :comment, dependent: :destroy
  has_one :item_transaction, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  mount_uploader :image, ImageUploader
  validates :user_id, presence: true
  validates :image, presence: true
  validate  :image_size
  validates :name, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 300 }
  validates :price, presence: true

  def self.search(search)
    if search
      where(['name LIKE ?', "%#{search}%"])
    else
      all
    end
  end

  private

  # アップロードされた画像のサイズをバリデーションする
  def image_size
    if image.size > 15.megabytes
      errors.add(:image, "should be less than 15MB")
    end
  end
end
