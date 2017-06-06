class CreateCabs < ActiveRecord::Migration[5.0]
  def change
    create_table :cabs do |t|
      t.string :color, index: true
      t.boolean :available, default: true

      t.timestamps
    end
  end
end
