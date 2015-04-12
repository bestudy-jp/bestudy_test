class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :body
      t.integer :pre_answer_id
      t.timestamps
    end
  end
end
