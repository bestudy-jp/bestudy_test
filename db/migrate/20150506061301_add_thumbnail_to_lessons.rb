class AddThumbnailToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :thumbnail, :string
  end
end
