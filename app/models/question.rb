# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

class Question < ActiveRecord::Base
  has_many :question_pre_answers
  has_many :pre_answers, through: :question_pre_answers, source: :answer
  has_many :answers

  scope :parent_questions, -> { where.not(id: QuestionPreAnswer.pluck(:question_id)) }

  accepts_nested_attributes_for :answers, allow_destroy: true
  accepts_nested_attributes_for :question_pre_answers, allow_destroy: true

  def answers_scheme
    ret = []
    answers.each do |answer|
      ret.push(id: answer.id, name: answer.body)
    end
    ret
  end
end
