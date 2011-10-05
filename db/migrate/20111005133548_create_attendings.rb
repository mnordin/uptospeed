class CreateAttendings < ActiveRecord::Migration
  def change
    create_table :attendings do |t|
      t.references :user
      t.references :event

      t.timestamps
    end
  end
end
