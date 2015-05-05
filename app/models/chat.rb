# == Schema Information
#
# Table name: chats
#
#  id         :integer          not null, primary key
#  message    :text
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Chat < ActiveRecord::Base
  belongs_to :user
end
