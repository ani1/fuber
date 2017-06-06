class CreateRides < ActiveRecord::Migration[5.0]
  def change
    create_table :rides do |t|
      t.integer :cab_id, null: false
      t.integer :user_id, null: false
      t.decimal :fare
      t.string :status, default: :started
      t.timestamps
    end
  end
end
