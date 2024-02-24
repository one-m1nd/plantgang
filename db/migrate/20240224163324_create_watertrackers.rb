class CreateWatertrackers < ActiveRecord::Migration[7.0]
  def change
    create_table :watertrackers do |t|
      t.date :date

      t.timestamps
    end
  end
end
