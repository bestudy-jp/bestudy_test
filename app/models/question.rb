# == Schema Information
#
# Table name: questions
#
#  id            :integer          not null, primary key
#  body          :text
#  created_at    :datetime
#  updated_at    :datetime
#  question_type :string(255)      not null
#  genre_id      :integer
#

class Question < ActiveRecord::Base
  has_many :question_pre_answers
  has_many :pre_answers, through: :question_pre_answers, source: :answer
  has_many :answers
  belongs_to :genre

  accepts_nested_attributes_for :answers, allow_destroy: true
  accepts_nested_attributes_for :question_pre_answers, allow_destroy: true

  module QuestionType
    SELECTION = 'selection'
    TEST = 'test'

    SELECT = {
      '目標設定' => SELECTION,
      '能力判定' => TEST
    }
  end

  scope :parent_questions, -> { where.not(id: QuestionPreAnswer.pluck(:question_id)) }
  scope :selection, -> { where(question_type: QuestionType::SELECTION) }
  scope :test, -> { where(question_type: QuestionType::TEST) }

  def test?
    QuestionType::TEST == question_type
  end

  def selection?
    QuestionType::SELECTION == question_type
  end

  def answers_scheme
    ret = []
    answers.each do |answer|
      ret.push(id: answer.id, name: answer.body)
    end
    ret
  end
end
