# == Schema Information
#
# Table name: chats
#
#  id         :integer          not null, primary key
#  message    :text
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  admin_name :string(255)
#

require 'test_helper'

class ChatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
