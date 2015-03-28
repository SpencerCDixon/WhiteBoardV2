class RemoveFamilyIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :family_id, :integer
  end
end
