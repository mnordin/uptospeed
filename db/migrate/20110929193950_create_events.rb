class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :google_id

      t.timestamps
    end
  end
end
