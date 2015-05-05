class Admin::LessonsController < ApplicationController
  layout 'admin'
  before_filter :get_lesson

  def index
    @search = Lesson.search(params[:q])
    @lessons = @search.result.page(params[:page]).per(50)
  end

  def new
    render :show_modal_form, layout: false
  end

  def create
    return unless params[:lesson]
    @lesson = Lesson.new(lesson_params)
    @lesson.save
    render layout: false
  end

  def edit
    render :show_modal_form, layout: false
  end

  def update
    @lesson.update(lesson_params)
    render layout: false
  end

  def destroy
    @lesson.destroy
    render layout: false
  end

  private

  def lesson_params
    params.require(:lesson).permit(
      :title, :author, :body, :price, :text_book_id,
      match_rates_attributes: [
        :id, :answer_id, :rate, :_destroy
      ],
      lesson_text_books_attributes: [
        :id, :text_book_id, :_destroy
      ],
      lesson_skills_attributes: [
        :id, :genre_id, :need_point, :reach_point, :_destroy
      ]
    )
  end

  def get_lesson
    @lesson = Lesson.find(params[:id]) if params[:id]
  end
end
