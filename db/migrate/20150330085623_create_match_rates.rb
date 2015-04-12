class CreateMatchRates < ActiveRecord::Migration
  def change
    create_table :match_rates do |t|
      t.integer :answer_id
      t.integer :lesson_id
      t.float :rate

      t.timestamps
    end
  end
end
