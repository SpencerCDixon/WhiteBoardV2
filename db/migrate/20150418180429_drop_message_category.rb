class DropMessageCategory < ActiveRecord::Migration
  def change
    drop_table :message_categories
  end
end
