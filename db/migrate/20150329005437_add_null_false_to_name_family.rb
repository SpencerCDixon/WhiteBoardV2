class AddNullFalseToNameFamily < ActiveRecord::Migration
  def change
    change_column :families, :name, :string, null: false
  end
end
