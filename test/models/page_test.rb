# == Schema Information
#
# Table name: pages
#
#  id           :integer          not null, primary key
#  text_book_id :integer          not null
#  image        :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class PageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
