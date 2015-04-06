class CreateFamilyInvitations < ActiveRecord::Migration
  def change
    create_table :family_invitations do |t|
      t.string :email
      t.integer :family_id
      t.integer :user_id
      t.string :token

      t.timestamps
    end
  end
end
