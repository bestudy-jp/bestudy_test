# == Schema Information
#
# Table name: genre_user_relations
#
#  id         :integer          not null, primary key
#  genre_id   :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class GenreUserRelation < ActiveRecord::Base
  belongs_to :genre
  belongs_to :user
end
