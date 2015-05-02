# == Schema Information
#
# Table name: match_rates
#
#  id         :integer          not null, primary key
#  answer_id  :integer
#  lesson_id  :integer
#  rate       :float(24)
#  created_at :datetime
#  updated_at :datetime
#

class MatchRate < ActiveRecord::Base
  belongs_to :answer
  belongs_to :lesson
end
