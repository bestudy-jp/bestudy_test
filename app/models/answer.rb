class Answer < ActiveRecord::Base
  has_many :match_rate
  has_many :lesson ,  through: :match_rate
  belongs_to :question
end
