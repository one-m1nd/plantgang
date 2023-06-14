class AddGenusIdToPlants < ActiveRecord::Migration[7.0]
  def change
    add_column :plants, :genus_id, :integer
    add_foreign_key :plants, :genus
  end
end
