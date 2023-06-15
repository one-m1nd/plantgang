class AddIndexToGenera < ActiveRecord::Migration[7.0]
  def change
    add_index :genera, :name, unique: true
  end
end
