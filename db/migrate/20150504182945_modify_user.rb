class ModifyUser < ActiveRecord::Migration
  def change
    add_column :users, :token, :string
    remove_column :users, :oauth_token
    remove_column :users, :oauth_expires_at
  end
end
