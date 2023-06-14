class AddFamilyIdToPlants < ActiveRecord::Migration[7.0]
  def change
    add_column :plants, :family_id, :integer
    add_foreign_key :plants, :families
  end
end
