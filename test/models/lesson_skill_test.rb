# == Schema Information
#
# Table name: lesson_skills
#
#  id          :integer          not null, primary key
#  lesson_id   :integer          not null
#  genre_id    :integer          not null
#  need_point  :integer          default(0), not null
#  reach_point :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class LessonSkillTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
