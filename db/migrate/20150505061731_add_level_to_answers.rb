class AddLevelToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :level, :integer, null: false, default: 0
  end
end
