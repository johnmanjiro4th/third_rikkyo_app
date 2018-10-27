class AddPriceToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :price, :integer, null: false, default: "300"
  end
end
