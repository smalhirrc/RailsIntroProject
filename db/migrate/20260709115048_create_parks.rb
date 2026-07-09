class CreateParks < ActiveRecord::Migration[8.1]
  def change
    create_table :parks do |t|
      t.integer :park_id
      t.string :park_name
      t.string :location_description
      t.string :park_category
      t.references :district, null: false, foreign_key: true

      t.timestamps
    end
    add_index :parks, :park_id, unique: true
  end
end
