class CreateQuestionPreAnswers < ActiveRecord::Migration
  def self.up
    create_table :question_pre_answers do |t|
      t.integer :question_id, null: false
      t.integer :answer_id, null: false

      t.timestamps
    end
    Question.all.each do |question|
      if question.pre_answer_id && question.pre_answer_id > 0 && Answer.where(id: question.pre_answer_id).count > 0
        QuestionPreAnswer.create(question_id: question.id, answer_id: question.pre_answer_id)
      end
    end
    remove_column :questions, :pre_answer_id
  end
end
