class CreateKudos < ActiveRecord::Migration
  def change
    create_table :kudos do |t|
      t.text :description
      t.string :picture
      t.integer :points
      t.datetime :date
      t.string :creator_id
      t.string :creator_name

      t.timestamps null: false
    end
  end
end
