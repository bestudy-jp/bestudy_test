class CreateTextBooks < ActiveRecord::Migration
  def change
    create_table :text_books do |t|
      t.string       :name

      t.timestamps
    end
  end
end
