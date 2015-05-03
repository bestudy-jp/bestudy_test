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

class QuestionPreAnswer < ActiveRecord::Base
  belongs_to :question
  belongs_to :answer
end
