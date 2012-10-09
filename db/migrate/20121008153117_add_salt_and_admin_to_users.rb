class AddSaltAndAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :salt, :string
    add_column :users, :admin, :boolean, :default => false
  end
end
