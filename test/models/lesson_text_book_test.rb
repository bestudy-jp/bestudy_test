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

require 'test_helper'

class LessonTextBookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
