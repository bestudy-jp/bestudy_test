class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer    :text_book_id, null: false
      t.string     :image

      t.timestamps
    end
  end
end
