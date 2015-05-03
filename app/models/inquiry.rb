# == Schema Information
#
# Table name: inquiries
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  message    :text
#  created_at :datetime
#  updated_at :datetime
#

class Inquiry < ActiveRecord::Base
end
