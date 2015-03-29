class RemoveTimestampsFromProfile < ActiveRecord::Migration
  def change
    remove_column :profiles, :timestamps, :string
    change_column :profiles, :user_id, :integer, null: false
  end
end
