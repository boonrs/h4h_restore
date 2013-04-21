class AddCoordinatorIdToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :coordinator_id, :integer
    add_index :donations, :coordinator_id
  end
end
