class AddIndexToFamilies < ActiveRecord::Migration[7.0]
  def change
    add_index :families, :name, unique: true
  end
end
