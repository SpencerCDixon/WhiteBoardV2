class CreateMessageCategories < ActiveRecord::Migration
  def change
    create_table :message_categories do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
