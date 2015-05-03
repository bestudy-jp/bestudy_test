class InquiriesController < ApplicationController
  def create
    @inquiry = Inquiry.create(inquiry_params)
    render :layout => false
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(
      :name, :email, :message
    )
  end
end
