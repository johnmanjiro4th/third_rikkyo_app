class AddNameToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :name, :string, after: :image, null: false
  end
end