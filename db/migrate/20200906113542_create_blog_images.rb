class CreateBlogImages < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_images do |t|
      t.integer :blog_id
      t.string :photo

      t.timestamps
    end
  end
end
