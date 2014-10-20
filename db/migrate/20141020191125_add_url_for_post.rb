class AddUrlForPost < ActiveRecord::Migration
  def up
    add_column :posts, :url_link, :string
    add_index  :posts, :url_link
  end

  def down
    remove_column :posts, :slug
    remove_index  :posts, :url_link
  end
end
