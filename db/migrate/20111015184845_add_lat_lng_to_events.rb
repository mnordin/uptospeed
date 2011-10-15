class AddLatLngToEvents < ActiveRecord::Migration
  def change
    add_column :events, :lat, :string
    add_column :events, :lng, :string
  end
end
