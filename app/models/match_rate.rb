class MatchRate < ActiveRecord::Base
  belongs_to :answer
  belongs_to :lesson
end
