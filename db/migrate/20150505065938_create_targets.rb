class CreateTargets < ActiveRecord::Migration
  def change
    create_table :targets do |t|
      t.string    :name

      t.timestamps
    end
  end
end
