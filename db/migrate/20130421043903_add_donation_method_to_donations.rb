class AddDonationMethodToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :donation_method, :string
  end
end
