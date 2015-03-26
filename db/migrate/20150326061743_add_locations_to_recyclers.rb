class AddLocationsToRecyclers < ActiveRecord::Migration
  def change
    add_column :recyclers, :locations, :integer
  end
end
