class AddAdminNameToChats < ActiveRecord::Migration
  def change
    add_column :chats, :admin_name, :string
  end
end
