class User < ApplicationRecord
  has_many :item, dependent: :destroy
  has_many :comment, dependent: :destroy
  has_many :seller_item_transaction, class_name: 'ItemTransaction', foreign_key: 'seller_id'
  has_many :buyer_item_transaction, class_name: 'ItemTransaction', foreign_key: 'buyer_id'
  has_many :item_transaction_comment, class_name: 'ItemTransactionComment', dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  VALID_EMAIL_REGEX = /\A[0-9]{2}[a-z]{2}[0-9]{3}[a-z]{1}@rikkyo.ac.jp\Z/
  validates :email, format: { with: VALID_EMAIL_REGEX }
end
