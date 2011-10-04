class AddGoogleEventFieldsToEvents < ActiveRecord::Migration
  def change
    #add_column :events, :google_id, :string google_id already present
    add_column :events, :title, :string
    add_column :events, :where, :text
    add_column :events, :start_time, :datetime
    add_column :events, :end_time, :datetime
  end
end
