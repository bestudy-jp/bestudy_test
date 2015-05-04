class AddTextBookIdToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :text_book_id, :integer
  end
end
