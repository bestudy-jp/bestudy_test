# == Schema Information
#
# Table name: radar_points
#
#  id         :integer          not null, primary key
#  answer_id  :integer          not null
#  name       :string(255)      not null
#  point      :integer          default(1), not null
#  created_at :datetime
#  updated_at :datetime
#

class RadarPoint < ActiveRecord::Base
  belongs_to :answer
end
