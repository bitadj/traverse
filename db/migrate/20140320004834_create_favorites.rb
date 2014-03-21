class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :location, index: true
      t.references :list, index: true

      t.timestamps
    end
  end
end
