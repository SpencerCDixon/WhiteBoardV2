class AddNameColumnToFamilyInvitations < ActiveRecord::Migration
  def change
    add_column :family_invitations, :name, :string
  end
end
