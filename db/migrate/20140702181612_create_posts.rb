class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :title_img
      t.integer :status, default: 0
      t.string :original
      t.text :body_title

      t.text :body
      t.text :rendered_body


      t.timestamps
    end
  end
end
