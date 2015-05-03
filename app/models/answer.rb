# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  question_id :integer
#  body        :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Answer < ActiveRecord::Base
  has_many :match_rates
  has_many :lesson ,  through: :match_rate
  belongs_to :question
end
