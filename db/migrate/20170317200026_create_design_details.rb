class CreateDesignDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :design_details do |t|
      t.float :height
      t.float :width
      t.float :x
      t.float :y
      t.float :rotation
      t.string :pic_id
      t.references :design, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
