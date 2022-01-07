class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :text
      t.references :user, foregign_key: true, null: false
      t.references :spot, foregign_key: true, null: false
      t.timestamps
    end
  end
end
