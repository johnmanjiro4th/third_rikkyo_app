class CreateItemTransactionComments < ActiveRecord::Migration[5.2]
  def change
    create_table :item_transaction_comments do |t|
      t.references :item_transaction, foreign_key: true
      t.references :user, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
