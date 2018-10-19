class AddUserNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string, after: :email, null: false
    add_index :users, :username, unique: true
  end
end
