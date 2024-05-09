class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.text :description
      t.string :feature_image
      t.string :visibility
      t.string :url

      t.timestamps
    end
  end
end
