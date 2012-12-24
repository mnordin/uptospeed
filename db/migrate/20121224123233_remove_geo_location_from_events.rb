class RemoveGeoLocationFromEvents < ActiveRecord::Migration
  def up
    remove_column :events, :lat
    remove_column :events, :lng
  end

  def down
    add_column :events, :lat, :string
    add_column :events, :lng, :string
  end
end
