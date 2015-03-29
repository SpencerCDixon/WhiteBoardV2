class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :name, null: false
      t.integer :user_id, null: false

      t.string :timestamps
    end
  end
end
