class LessonController < ApplicationController
  before_action :authenticate_user!

  def show
    @lesson = Lesson.find(params[:id]) if params[:id]
  end
end
