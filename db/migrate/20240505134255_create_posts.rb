class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :uuid, null: false
      t.string :title, null: false
      t.string :slug, null: false
      t.integer :comment_id, index: true, foreign_key: true, null: true
      t.string :feature_image
      t.boolean :featured, default: false, null: false
      t.string :visibility
      t.datetime :published_at
      t.string :custom_excerpt
      t.integer :primary_tag_id, index: true, foreign_key: true, null: true
      t.string :url, null: false
      t.string :excerpt
      t.integer :reading_time
      t.boolean :access, default: false, null: false
      t.boolean :comments, default: false, null: false

      t.timestamps
    end
  end
end
