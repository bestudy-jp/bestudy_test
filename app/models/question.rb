class Question < ActiveRecord::Base
  has_many :answer, foreign_key: :pre_answer_id
  has_many :answer
end
