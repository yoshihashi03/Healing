class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|

    	t.text :title, null: false
    	t.text :body, null: false
    	t.string :address, null: false
    	t.string :url_content
    	t.integer :genre, null: false, default: 0
      t.integer :customer_id

      	t.timestamps
    end
  end
end
