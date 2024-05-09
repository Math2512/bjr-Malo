class ChangedIdToString < ActiveRecord::Migration[7.0]
  def up

    change_column :posts, :id, :string
    change_column :posts, :primary_tag_id, :string
    change_column :posts, :comment_id, :string
    change_column :tags, :id, :string

    change_column :post_tags, :post_id, :string
    change_column :post_tags, :tag_id, :string
  end
end
