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
  has_many :radar_points
  belongs_to :question

  accepts_nested_attributes_for :radar_points, allow_destroy: true
end
