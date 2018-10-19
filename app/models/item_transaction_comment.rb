class ItemTransactionComment < ApplicationRecord
  belongs_to :item_transaction
  belongs_to :user
  validates :body, presence: true
end
