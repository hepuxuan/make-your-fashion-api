class CreateJoinTableDesignTag < ActiveRecord::Migration[5.0]
  def change
    create_join_table :designs, :tags do |t|
      # t.index [:design_id, :tag_id]
      # t.index [:tag_id, :design_id]
    end
  end
end
