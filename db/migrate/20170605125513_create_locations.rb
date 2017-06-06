class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.decimal :latitude, precision: 5, scale: 2, null: false
      t.decimal :longitude, precision: 5, scale: 2, null: false
      t.references :locatable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
