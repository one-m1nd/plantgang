class AddYearAcquiredToPlants < ActiveRecord::Migration[7.0]
  def change
    add_column :plants, :year_acquired, :integer
  end
end
