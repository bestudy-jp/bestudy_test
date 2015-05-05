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

class LessonSkill < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :genre
end
