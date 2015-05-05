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
end
