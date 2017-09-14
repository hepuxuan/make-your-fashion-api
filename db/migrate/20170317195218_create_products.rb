class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :item_id
      t.integer :ratings
      t.decimal :price
      t.string :name
      t.string :description
      t.string :img_front
      t.string :img_back
      t.string :img
      t.string :name
      t.string :color
      t.string :sizes
      t.string :product_type
      t.references :category, foreign_key: true
      t.references :campaign, foreign_key: true
      t.timestamps
    end
  end
end
