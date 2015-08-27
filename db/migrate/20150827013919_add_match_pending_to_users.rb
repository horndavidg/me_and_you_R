class AddMatchPendingToUsers < ActiveRecord::Migration
  def change
    add_column :users, :match_pending, :boolean, :default => false
  end
end
