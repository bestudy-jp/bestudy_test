# == Schema Information
#
# Table name: user_purchases
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  lesson_id  :integer          not null
#  price      :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class UserPurchase < ActiveRecord::Base
  belongs_to :user
  belongs_to :lesson
end
