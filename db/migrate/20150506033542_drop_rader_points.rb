class DropRaderPoints < ActiveRecord::Migration
  def change
    drop_table :radar_points
  end
end
