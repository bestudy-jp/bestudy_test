class Admin::AnswersController < ApplicationController
  layout 'admin'
  before_filter :get_answer

  def index
    @search = Answer.search(params[:q])
    @answers = @search.result.page(params[:page]).per(50)
  end

  def new
    render :show_modal_form, layout: false
  end

  def create
    return unless params[:answer]
    @answer = Answer.new(answer_params)
    @answer.save
    render layout: false
  end

  def edit
    render :show_modal_form, layout: false
  end

  def update
    @answer.update(answer_params)
    render layout: false
  end

  def destroy
    @answer.destroy
    render layout: false
  end

  private

  def answer_params
    params.require(:answer).permit(
      :question_id, :body, :level,
      radar_points_attributes: [
        :id, :name, :point, :_destroy
      ]
    )
  end

  def get_answer
    @answer = Answer.find(params[:id]) if params[:id]
  end
end
