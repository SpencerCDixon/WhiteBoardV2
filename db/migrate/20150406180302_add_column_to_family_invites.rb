class AddColumnToFamilyInvites < ActiveRecord::Migration
  def change
    add_column :family_invitations, :sent_at, :datetime
  end
end
