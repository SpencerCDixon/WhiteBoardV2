class AddUserIdToPrivateMessage < ActiveRecord::Migration
  def change
    add_column :private_messages, :user_id, :integer
  end
end
