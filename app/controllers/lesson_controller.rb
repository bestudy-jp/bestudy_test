class LessonController < ApplicationController
  def show
    @lesson = Lesson.find(params[:id]) if params[:id]
  end

  def purchase
    @lesson = Lesson.find(params[:id]) if params[:id]
    redirect_to 'home' && return unless @lesson
  end
end
