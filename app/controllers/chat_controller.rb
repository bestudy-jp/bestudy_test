class ChatController < ApplicationController
  def create
    unless params[:message].blank?
      @chat = Chat.create(
        message: params[:message],
        user_id: user_signed_in? ? current_user.id : nil
      )
    end
    render layout: false
  end

  def more
    date = DateTime.parse(params[:from])
    lid = params[:last_chat_id]
    date = DateTime.now - 30.minutes if date + 30.minutes < DateTime.now
    @chats = []
    Chat.where('id > ? AND created_at > ?', lid, date).each do |chat|
      @chats.push(chat)
    end

    render layout: false
  end
end
