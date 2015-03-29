class CreateElectronicsStores < ActiveRecord::Migration
  def change
    create_table :electronics_stores do |t|
      t.text :name
      t.text :main_address
      t.text :phone
      t.text :website
      t.text :email
      t.integer :number_of_locations
      t.boolean :sells_tablets
      t.boolean :sells_phones

      t.timestamps null: false
    end
  end
end
