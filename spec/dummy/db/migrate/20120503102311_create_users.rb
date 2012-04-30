class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid
      t.string :token_key
      t.string :token_secret
      t.string :user_info

      t.timestamps
    end
    add_index :users, :uid, :unique => true
  end
end
