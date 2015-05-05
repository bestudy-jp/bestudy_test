class LessonController < ApplicationController
  before_action :authenticate_user!, only: [:result]

  def show
    @lesson = Lesson.find(params[:id]) if params[:id]
  end

  def purchase
    @lesson = Lesson.find(params[:id]) if params[:id]
    redirect_to 'home' && return unless @lesson
    Notification.purchase(@lesson).deliver

    session[:user_return_to] = nil
    if user_signed_in?
      UserPurchase.create(
        user_id: current_user.id,
        lesson_id: @lesson.id,
        price: @lesson.price.to_i
      )
    else
      session[:user_return_to] = lesson_show_path(@lesson.id)
    end
  end

  def result
    @lesson = Lesson.find(params[:id]) if params[:id]
    redirect_to user_root_path unless @lesson
    redirect_to user_root_path unless current_user.bought?(@lesson)
  end
end
