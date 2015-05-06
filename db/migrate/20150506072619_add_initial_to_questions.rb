class AddInitialToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :initial, :boolean, default: false, null: false
  end
end
