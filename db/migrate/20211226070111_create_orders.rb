class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :customer
      t.string :not_tradeable
      t.references :user, foregign_key: true
      t.references :spot, foregign_key: true
      t.timestamps
    end
  end
end
