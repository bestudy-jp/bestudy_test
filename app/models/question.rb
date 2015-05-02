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
  has_many :answer, foreign_key: :pre_answer_id
  has_many :answer
end
