# == Schema Information
#
# Table name: target_skills
#
#  id         :integer          not null, primary key
#  target_id  :integer          not null
#  genre_id   :integer          not null
#  point      :integer          default(0), not null
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class TargetSkillTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
