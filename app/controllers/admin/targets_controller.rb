class Admin::TargetsController < ApplicationController
  layout 'admin'
  before_filter :get_target

  def index
    @search = Target.search(params[:q])
    @targets = @search.result.page(params[:page]).per(50)
  end

  def new
    render :show_modal_form, layout: false
  end

  def create
    return unless params[:target]
    @target = Target.new(target_params)
    @target.save
    render layout: false
  end

  def edit
    render :show_modal_form, layout: false
  end

  def update
    @target.update(target_params)
    render layout: false
  end

  def destroy
    @target.destroy
    render layout: false
  end

  private

  def target_params
    params.require(:target).permit(
      :name,
      target_skills_attributes: [
        :id, :genre_id, :point, :_destroy
      ]
    )
  end

  def get_target
    @target = Target.find(params[:id]) if params[:id]
  end
end
