class Genre < ActiveRecord::Base
  has_many :genre_user_relation
end
