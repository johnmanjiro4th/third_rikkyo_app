class ItemTransaction < ApplicationRecord
  belongs_to :item, class_name: "Item"
  belongs_to :seller, class_name: "User", foreign_key: 'seller_id'
  belongs_to :buyer, class_name: "User", foreign_key: 'buyer_id'
  has_many :item_transaction_comment, dependent: :destroy
end
