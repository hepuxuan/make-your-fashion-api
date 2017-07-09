class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :status
      t.string :name
      t.string :address
      t.string :phone
      t.decimal :ship_fee
      t.decimal :promotion
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
