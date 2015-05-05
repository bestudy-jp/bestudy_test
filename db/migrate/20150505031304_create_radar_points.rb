class CreateRadarPoints < ActiveRecord::Migration
  def change
    create_table :radar_points do |t|
      t.integer :answer_id, null: false
      t.string :attribute, null: false
      t.integer :point, null: false, default: 1

      t.timestamps
    end
  end
end
