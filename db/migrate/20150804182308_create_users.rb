class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :picture
      t.string :match
      t.integer :score
      t.string :name
      t.string :password_digest
      t.string :password_reset_token

      t.timestamps null: false
    end
  end
end
