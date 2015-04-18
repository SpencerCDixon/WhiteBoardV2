class ChangeColumnOnFamilyMessage < ActiveRecord::Migration
  def change
    remove_column :family_messages, :message_category_id, :integer
    add_column :family_messages, :category, :string
  end
end
