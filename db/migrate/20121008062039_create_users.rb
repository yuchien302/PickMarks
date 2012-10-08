class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :email
      t.string :avatar
      t.string :oauth_token
      t.datetime :oauth_expires_at

      t.timestamps
    end
    add_index :users, :uid, :unique => true
  end
end
