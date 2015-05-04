class CreateUserPurchases < ActiveRecord::Migration
  def change
    create_table :user_purchases do |t|
      t.integer :user_id, null: false
      t.integer :lesson_id, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
