class AddDetailHashToUsers < ActiveRecord::Migration
  def change
    add_column :users, :detail_hash, :text
  end
end
