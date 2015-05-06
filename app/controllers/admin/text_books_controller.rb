class Admin::TextBooksController < ApplicationController
  layout 'admin'
  before_filter :get_text_book

  def index
    @search = TextBook.search(params[:q])
    @text_books = @search.result.page(params[:page]).per(50)
  end

  def new
    render :show_modal_form, layout: false
  end

  def create
    if params[:slideshare_url].blank?
      return unless params[:text_book]
      @text_book = TextBook.new(text_book_params)
      @text_book.save
    else
      @text_book = TextBook.generate_from_slideshare(params[:slideshare_url])
    end
    render layout: false
  end

  def edit
    render :show_modal_form, layout: false
  end

  def update
    @text_book.update(text_book_params)
    render layout: false
  end

  def destroy
    @text_book.destroy
    render layout: false
  end

  def regenerate_thumbs
    TextBook.all.each do |textbook|
      textbook.pages.each do |page|
        page.image.recreate_versions!
        page.save!
      end
    end
  end

  private

  def text_book_params
    params.require(:text_book).permit(
      :name, pages_attributes: [
        :id, :text_book_id, :image, :_destroy
      ]
    )
  end

  def get_text_book
    @text_book = TextBook.find(params[:id]) if params[:id]
  end
end
