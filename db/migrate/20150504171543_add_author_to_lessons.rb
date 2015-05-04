class AddAuthorToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :author, :string
  end
end
