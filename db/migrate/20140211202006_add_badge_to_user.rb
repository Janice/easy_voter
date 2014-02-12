class AddBadgeToUser < ActiveRecord::Migration
  def change
    add_column :users, :badge, :integer
    remove_column :users, :email, :string
  end
end
