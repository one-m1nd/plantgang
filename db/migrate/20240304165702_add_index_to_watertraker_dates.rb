class AddIndexToWatertrakerDates < ActiveRecord::Migration[7.0]
  def change
    add_index :watertrackers, :date
  end
end
