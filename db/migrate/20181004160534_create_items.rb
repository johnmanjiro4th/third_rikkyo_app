class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.text :content, null: false
      t.string :image, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
    add_index :items, [:user_id, :created_at]
  end
end
