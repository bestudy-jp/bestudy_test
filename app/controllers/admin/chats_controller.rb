class Admin::ChatsController < ApplicationController
  layout 'admin'
  before_filter :get_chat

  def index
    @search = Chat.search(params[:q])
    @chats = @search.result.page(params[:page]).per(50)
  end

  def new
    render :show_modal_form, layout: false
  end

  def create
    return unless params[:chat]
    @chat = Chat.new(chat_params)
    @chat.save
    render layout: false
  end

  def edit
    render :show_modal_form, layout: false
  end

  def update
    @chat.update(chat_params)
    render layout: false
  end

  def destroy
    @chat.destroy
    render layout: false
  end

  private

  def chat_params
    params.require(:chat).permit(
      :message, :user_id
    )
  end

  def get_chat
    @chat = Chat.find(params[:id]) if params[:id]
  end
end
