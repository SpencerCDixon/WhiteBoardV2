class AddNullFalseToFamilyMemberships < ActiveRecord::Migration
  def change
    change_column :family_memberships, :user_id, :integer, null: false
    change_column :family_memberships, :family_id, :integer, null: false
  end
end
