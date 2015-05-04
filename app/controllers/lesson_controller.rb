class LessonController < ApplicationController
  def show
    @lesson = Lesson.find(params[:id]) if params[:id]
  end

  def purchase
    @lesson = Lesson.find(params[:id]) if params[:id]
    redirect_to 'home' && return unless @lesson

    if user_signed_in?
      UserPurchase.create(
        user_id: current_user.id,
        lesson_id: @lesson.id,
        price: @lesson.price.to_i
      )
    end
  end
end
