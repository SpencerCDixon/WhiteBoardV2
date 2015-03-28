class RemoveUserIdFromFamily < ActiveRecord::Migration
  def change
    remove_column :families, :user_id, :integer
    remove_column :families, :timestamps, :string
  end
end
