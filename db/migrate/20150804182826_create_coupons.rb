class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.text :description
      t.integer :price
      t.string :creator_id
      t.string :creator_name
      t.string :design_id

      t.timestamps null: false
    end
  end
end
