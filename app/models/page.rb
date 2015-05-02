# == Schema Information
#
# Table name: pages
#
#  id           :integer          not null, primary key
#  text_book_id :integer          not null
#  image        :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Page < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :text_book
end
