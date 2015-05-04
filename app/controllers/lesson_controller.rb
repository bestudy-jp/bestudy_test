class LessonController < ApplicationController
  def show
    @lesson = Lesson.find(params[:id]) if params[:id]
  end

  def purchase
    @lesson = Lesson.find(params[:id]) if params[:id]
    redirect_to 'home' && return unless @lesson

    session[:user_return_to] = nil
    if user_signed_in?
      UserPurchase.create(
        user_id: current_user.id,
        lesson_id: @lesson.id,
        price: @lesson.price.to_i
      )
    else
      session[:user_return_to] = lesson_show(@lesson.id)
    end
  end
end
