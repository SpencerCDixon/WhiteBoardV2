class AddColumnToFamilyMessage < ActiveRecord::Migration
  def change
    add_column :family_messages, :message_category_id, :integer, null: false
  end
end
