class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :uuid
      t.string :name
      t.string :address
      t.string :email
      t.string :token
      t.string :phone
      t.string :password_digest
      t.timestamps
    end
  end
end
