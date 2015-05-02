class CreateGenreUserRelations < ActiveRecord::Migration
  def change
    create_table :genre_user_relations do |t|
      t.integer :genre_id
      t.integer :user_id
      t.timestamps
    end
  end
end
