class FixNewsletterTypo < ActiveRecord::Migration
  def change
    rename_column :donors, :receive_newletters, :receive_newsletters
  end
end
