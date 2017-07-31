class CreateDesigns < ActiveRecord::Migration[5.0]
  def change
    create_table :designs do |t|
      t.string :img_url
      t.boolean :is_private, default: false
      t.timestamps
    end
  end
end
