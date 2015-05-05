class AddGenreToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :genre_id, :integer
  end
end
