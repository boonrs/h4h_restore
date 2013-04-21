class CreateDonors < ActiveRecord::Migration
  def change
    create_table :donors do |t|
      t.string :name
      t.string :company
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :phone
      t.string :email
      t.boolean :receive_newletters, default: false
      t.boolean :receive_email, default: false
      t.text :notes

      t.timestamps
    end
  end
end
