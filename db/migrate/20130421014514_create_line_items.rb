class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.string :name
      t.text :notes
      t.integer :quantity
      t.references :donation

      t.timestamps
    end
    add_index :line_items, :donation_id
  end
end
