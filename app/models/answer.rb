# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  question_id :integer
#  body        :text
#  created_at  :datetime
#  updated_at  :datetime
#  level       :integer          default(0), not null
#  target_id   :integer
#

class Answer < ActiveRecord::Base
  has_many :match_rates
  has_many :lesson ,  through: :match_rate
  has_many :radar_points
  belongs_to :question
  belongs_to :target

  accepts_nested_attributes_for :radar_points, allow_destroy: true

  def self.radar_points_from_answer_ids(answer_ids)
    ret = {}
    Answer.where(id: answer_ids).includes(:radar_points).each do |answer|
      next if answer.radar_points.count <= 0
      answer.radar_points.each do |rp|
        ret[rp.name] ||= 0
        ret[rp.name] += rp.point
      end
    end
    ret
  end
end
