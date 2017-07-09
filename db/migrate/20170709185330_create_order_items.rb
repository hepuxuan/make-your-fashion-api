class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.integer :item_id
      t.decimal :price
      t.string :size
      t.integer :qty
      t.string :print_front
      t.string :print_back
      t.string :img
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
