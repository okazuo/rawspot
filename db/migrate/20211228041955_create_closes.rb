class CreateCloses < ActiveRecord::Migration[6.0]
  def change
    create_table :closes do |t|
      t.string :not_available
      t.references :user, foregign_key: true, null: false
      t.references :spot, foregign_key: true, null: false
      t.timestamps
    end
  end
end
