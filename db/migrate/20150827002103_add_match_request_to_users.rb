class AddMatchRequestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :match_request, :integer
  end
end
