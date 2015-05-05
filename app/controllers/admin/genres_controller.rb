class Admin::GenresController < ApplicationController
  layout 'admin'
  before_filter :get_genre

  def index
    @search = Genre.search(params[:q])
    @genres = @search.result.page(params[:page]).per(50)
  end

  def new
    render :show_modal_form, layout: false
  end

  def create
    return unless params[:genre]
    @genre = Genre.new(genre_params)
    @genre.save
    render layout: false
  end

  def edit
    render :show_modal_form, layout: false
  end

  def update
    @genre.update(genre_params)
    render layout: false
  end

  def destroy
    @genre.destroy
    render layout: false
  end

  private

  def genre_params
    params.require(:genre).permit(
      :name, :parent_genre_id
    )
  end

  def get_genre
    @genre = Genre.find(params[:id]) if params[:id]
  end
end
