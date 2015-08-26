class AddMatchIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :match_id, :integer
  end
end
