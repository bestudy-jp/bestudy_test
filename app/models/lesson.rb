# == Schema Information
#
# Table name: lessons
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  body       :text
#  price      :integer
#  created_at :datetime
#  updated_at :datetime
#  author     :string(255)
#  thumbnail  :string(255)
#

class Lesson < ActiveRecord::Base
  has_many :match_rates, dependent: :destroy
  has_many :lesson_text_books, dependent: :destroy
  has_many :text_books, through: :lesson_text_books
  has_many :user_purchases
  has_many :lesson_skills, dependent: :destroy

  mount_uploader :thumbnail, ImageUploader

  accepts_nested_attributes_for :lesson_skills, allow_destroy: true
  accepts_nested_attributes_for :match_rates, allow_destroy: true
  accepts_nested_attributes_for :lesson_text_books, allow_destroy: true
end
