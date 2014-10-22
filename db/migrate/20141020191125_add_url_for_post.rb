class AddUrlForPost < ActiveRecord::Migration
  def up
    add_column :posts, :url_link, :string, null: false
    add_index  :posts, :url_link, unique: true
  end

  def down
    remove_column :posts, :slug
    remove_index  :posts, :url_link
  end
end
