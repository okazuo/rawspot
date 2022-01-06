class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :customer
      t.references :user, foregign_key: true, null: false
      t.references :spot, foregign_key: true, null: false
      t.timestamps
    end
  end
end
