class AddPhotosToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :photos, :string
  end
end
