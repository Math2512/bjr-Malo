class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.text :activity, null: true
      t.references :client, index: true, foreign_key: true, null: false
      t.boolean :status
      t.timestamps
    end
  end
end
