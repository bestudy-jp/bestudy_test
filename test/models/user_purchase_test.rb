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

require 'test_helper'

class UserPurchaseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
