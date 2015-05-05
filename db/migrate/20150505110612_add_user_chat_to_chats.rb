class AddUserChatToChats < ActiveRecord::Migration
  def change
    add_column :chats, :user_chat, :boolean, null: false, default: true
  end
end
