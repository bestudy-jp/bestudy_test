class Admin::QuestionsController < ApplicationController
  layout 'admin'
  before_filter :get_question

  def index
    @search = Question.search(params[:q])
    @questions = @search.result.page(params[:page]).per(50)
  end

  def new
    render :show_modal_form, layout: false
  end

  def create
    return unless params[:question]
    @question = Question.new(question_params)
    @question.save
    render layout: false
  end

  def edit
    render :show_modal_form, layout: false
  end

  def update
    @question.update(question_params)
    render layout: false
  end

  def destroy
    @question.destroy
    render layout: false
  end

  private

  def question_params
    params.require(:question).permit(
      :body, :genre_id,
      question_pre_answers_attributes: [
        :id, :answer_id, :_destroy
      ],
      answers_attributes: [
        :id, :body, :level, :_destroy
      ]
    )
  end

  def get_question
    @question = Question.find(params[:id]) if params[:id]
  end
end
