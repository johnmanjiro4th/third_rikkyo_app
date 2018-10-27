class CreateItemTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :item_transactions do |t|
      t.references :item, foreign_key: true
      t.references :seller, foreign_key: true
      t.references :buyer, foreign_key: true

      t.timestamps
    end
  end
end
