class AddContentFieldToEvents < ActiveRecord::Migration
  def change
    add_column :events, :content, :text
  end
end
