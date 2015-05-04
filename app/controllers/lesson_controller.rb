class LessonController < ApplicationController
  def show
    @lesson = Lesson.find(params[:id]) if params[:id]
  end
end
