class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name
      t.integer :parent_genre_id
      t.timestamps
    end
  end
end
