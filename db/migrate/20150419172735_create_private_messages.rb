class CreatePrivateMessages < ActiveRecord::Migration
  def change
    create_table :private_messages do |t|
      t.integer :conversation_id
      t.text :body

      t.timestamps null: false
    end
  end
end
