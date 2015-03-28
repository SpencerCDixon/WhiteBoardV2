class ReCreateFamilies < ActiveRecord::Migration
  def change
    drop_table :families

    create_table :families do |f|
      f.string :name

      f.timestamps
    end
  end
end
