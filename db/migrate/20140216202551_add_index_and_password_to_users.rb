class AddIndexAndPasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string
    add_column :users, :remember_token, :string
    add_index  :users, :remember_token
    add_index  :users, :badge, unique: true
  end
end
