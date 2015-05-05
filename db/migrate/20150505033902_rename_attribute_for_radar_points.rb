class RenameAttributeForRadarPoints < ActiveRecord::Migration
  def change
    rename_column :radar_points, :attribute, :name
  end
end
