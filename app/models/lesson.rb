# == Schema Information
#
# Table name: lessons
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  body       :text
#  price      :integer
#  created_at :datetime
#  updated_at :datetime
#

class Lesson < ActiveRecord::Base
  has_many :match_rates
end
