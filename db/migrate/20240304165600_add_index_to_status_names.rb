class AddIndexToStatusNames < ActiveRecord::Migration[7.0]
  def change
    add_index :statuses, :name
  end
end
