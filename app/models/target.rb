# == Schema Information
#
# Table name: targets
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Target < ActiveRecord::Base
  has_many :target_skills
  has_many :answers

  accepts_nested_attributes_for :target_skills, allow_destroy: true
end
