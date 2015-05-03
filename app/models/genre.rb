# == Schema Information
#
# Table name: genres
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  parent_genre_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class Genre < ActiveRecord::Base
  has_many :genre_user_relation

  def self.parents_scheme
    ret = []
    where(parent_genre_id: nil).each do |genre|
      ret.push(id: genre.id, name: genre.name)
    end
    ret
  end
end
