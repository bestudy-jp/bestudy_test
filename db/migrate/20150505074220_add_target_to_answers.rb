class AddTargetToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :target_id, :integer
  end
end
