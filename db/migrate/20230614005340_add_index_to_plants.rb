class AddIndexToPlants < ActiveRecord::Migration[7.0]
  def change
    add_index :plants, :name, unique: true
  end
end
