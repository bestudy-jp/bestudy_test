class CreateLessonTextBooks < ActiveRecord::Migration
  def self.up
    create_table :lesson_text_books do |t|
      t.integer :text_book_id, null: false
      t.integer :lesson_id, null: false

      t.timestamps
    end

    Lesson.all.each do |lesson|
      next if lesson.text_book_id.nil? || lesson.text_book_id <= 0
      LessonTextBook.create(lesson_id: lesson.id, text_book_id: lesson.text_book_id)
    end
    remove_column :lessons, :text_book_id
  end
end
