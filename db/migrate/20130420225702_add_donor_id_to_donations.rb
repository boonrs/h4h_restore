class AddDonorIdToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :donor_id, :integer
    add_index :donations, :donor_id
  end
end
