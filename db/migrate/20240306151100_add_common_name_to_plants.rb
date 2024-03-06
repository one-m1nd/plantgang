class AddCommonNameToPlants < ActiveRecord::Migration[7.0]
  def change
    add_column :plants, :common_name, :string
    add_index :plants, :common_name
  end
end
