class CreateFamilyMemberships < ActiveRecord::Migration
  def change
    create_table :family_memberships do |t|
      t.integer :user_id
      t.integer :family_id

      t.timestamps
    end

    add_index :family_memberships, [:user_id, :family_id], unique: true
  end
end
