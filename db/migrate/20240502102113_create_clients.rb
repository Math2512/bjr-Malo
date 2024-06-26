class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.text :address
      t.string :zip_code
      t.string :city
      t.boolean :private, default: false, null: false
      t.string :key
      t.string :password

      t.timestamps
    end
  end
end
