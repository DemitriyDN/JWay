class AddMetaTagsToPost < ActiveRecord::Migration
  def change
    add_column :posts, :meta, :string, default: ''
  end
end
