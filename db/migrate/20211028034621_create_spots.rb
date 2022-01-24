class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|
      t.integer :price
      t.string  :estate_agent
      t.integer :size
      t.string :address
      t.integer :water_id
      t.integer :officialmap_id
      t.integer :transcript_id
      t.text :explanation
      t.integer :contact_id
      t.decimal :latitude, precision: 9, scale: 6
      t.decimal :longitude, precision: 9, scale: 6
      t.references :user, null: false, foregign_key: true
      t.timestamps
    end
  end
end
