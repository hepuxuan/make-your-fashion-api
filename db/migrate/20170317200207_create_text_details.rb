class CreateTextDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :text_details do |t|
      t.string :text
      t.integer :font_size
      t.string :font_family
      t.string :color
      t.string :align
      t.boolean :bold
      t.boolean :italic
      t.float :height
      t.float :width
      t.float :x
      t.float :y
      t.float :rotation
      t.string :pic_id
      t.references :product, foreign_key: true
      t.timestamps
    end
  end
end
