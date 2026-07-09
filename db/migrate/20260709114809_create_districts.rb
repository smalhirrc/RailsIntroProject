class CreateDistricts < ActiveRecord::Migration[8.1]
  def change
    create_table :districts do |t|
      t.string :district_name

      t.timestamps
    end
  end
end
