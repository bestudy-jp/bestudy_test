# == Schema Information
#
# Table name: questions
#
#  id            :integer          not null, primary key
#  body          :text
#  pre_answer_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Question < ActiveRecord::Base
  belongs_to :pre_answer, foreign_key: :pre_answer_id, class_name: 'Answer'
  has_many :answers

  scope :parent_question, -> { where('pre_answer_id = ? OR pre_answer_id = ?', nil, 0) }

  accepts_nested_attributes_for :answers, allow_destroy: true

  def answers_scheme
    ret = []
    answers.each do |answer|
      ret.push(id: answer.id, name: answer.body)
    end
    ret
  end
end
