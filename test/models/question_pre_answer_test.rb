# == Schema Information
#
# Table name: question_pre_answers
#
#  id          :integer          not null, primary key
#  question_id :integer          not null
#  answer_id   :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class QuestionPreAnswerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
