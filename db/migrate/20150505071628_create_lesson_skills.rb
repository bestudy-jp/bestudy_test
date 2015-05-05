class CreateLessonSkills < ActiveRecord::Migration
  def change
    create_table :lesson_skills do |t|
      t.integer :lesson_id, null: false
      t.integer :genre_id, null: false
      t.integer :need_point, null: false, default: 0
      t.integer :reach_point

      t.timestamps
    end
  end
end
