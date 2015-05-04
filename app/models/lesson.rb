# == Schema Information
#
# Table name: lessons
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  body         :text
#  price        :integer
#  created_at   :datetime
#  updated_at   :datetime
#  text_book_id :integer
#

class Lesson < ActiveRecord::Base
  has_many :match_rates
  belongs_to :text_book

  accepts_nested_attributes_for :match_rates, allow_destroy: true
end
