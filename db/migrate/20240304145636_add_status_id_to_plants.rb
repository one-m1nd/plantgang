class AddStatusIdToPlants < ActiveRecord::Migration[7.0]
  def change
    add_column :plants, :status_id, :integer
    add_foreign_key :plants, :statuses
  end
end
