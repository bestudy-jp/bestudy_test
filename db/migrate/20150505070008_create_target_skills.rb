class CreateTargetSkills < ActiveRecord::Migration
  def change
    create_table :target_skills do |t|
      t.integer :target_id, null: false
      t.integer :genre_id, null: false
      t.integer :point, null: false, default: 0

      t.timestamps
    end
  end
end
