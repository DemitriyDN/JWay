class ChangePostIdInPostTags < ActiveRecord::Migration
  def up
    add_column :posts_tags, :post_url_link, :string

    remove_index :posts_tags, :post_id
    remove_index :posts_tags, [:post_id, :tag_id]

    execute <<-SQL
      UPDATE posts_tags
        SET post_url_link = (
          SELECT (
            p.url_link
          )
          FROM posts p
          WHERE posts_tags.post_id = p.id
        )
    SQL


    remove_column :posts_tags, :post_id

    add_index :posts_tags, :post_url_link
    add_index :posts_tags, [:post_url_link, :tag_id]
  end

  def down
    add_column :posts_tags, :post_id, :integer

    remove_index :posts_tags, :post_url_link
    remove_index :posts_tags, [:post_url_link, :tag_id]

    execute <<-SQL
      UPDATE posts_tags
        SET post_id = (
          SELECT (
            p.id
          )
          FROM posts p
          WHERE posts_tags.post_url_link = p.url_link
        )
    SQL


    remove_column :posts_tags, :post_url_link

    add_index :posts_tags, :post_id
    add_index :posts_tags, [:post_id, :tag_id]
  end
end
