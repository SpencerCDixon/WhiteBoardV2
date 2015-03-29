class CreateFamilyMessages < ActiveRecord::Migration
  def change
    create_table :family_messages do |t|
      t.integer :user_id, null: false
      t.integer :family_id, null: false
      t.text :message, null: false

      t.timestamps
    end
  end
end
