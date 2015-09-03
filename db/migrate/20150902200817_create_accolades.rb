class CreateAccolades < ActiveRecord::Migration
  def change
    create_table :accolades do |t|
      t.references :user, index: true, foreign_key: true
      t.references :kudo, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
