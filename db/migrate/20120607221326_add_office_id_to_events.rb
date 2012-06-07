class AddOfficeIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :office_id, :integer
  end
end
