# == Schema Information
#
# Table name: lesson_text_books
#
#  id           :integer          not null, primary key
#  text_book_id :integer          not null
#  lesson_id    :integer          not null
#  created_at   :datetime
#  updated_at   :datetime
#

class LessonTextBook < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :text_book
end
