class CreateAssets < ActiveRecord::Migration[8.1]
  def change
    create_table :assets do |t|
      t.integer :asset_id
      t.references :park, null: false, foreign_key: true
      t.string :asset_class
      t.string :asset_type
      t.string :asset_size

      t.timestamps
    end
    add_index :assets, :asset_id, unique: true
  end
end
