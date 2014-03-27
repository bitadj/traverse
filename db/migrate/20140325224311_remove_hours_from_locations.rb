class RemoveHoursFromLocations < ActiveRecord::Migration
  def change
    remove_column :locations, :chef, :string
  end
end
