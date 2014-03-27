class AddMichelinRateToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :michelinrate, :integer
  end
end
