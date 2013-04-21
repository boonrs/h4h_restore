class AddValueToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :value, :integer
    add_column :donations, :donated_on, :date
  end
end
