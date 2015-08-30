class AddUserIdToKudos < ActiveRecord::Migration
  def change
    add_column :kudos, :user_id, :string
  end
end
