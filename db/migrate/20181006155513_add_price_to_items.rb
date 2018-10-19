class AddPriceToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :price, :integer, after: :image, null: false
  end
end
