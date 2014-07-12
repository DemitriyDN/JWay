class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :title_img
      t.text :body_title
      t.text :body
      t.integer :status, default: 0
      t.string :original

      t.timestamps
    end
  end
end
