class CreateRead < ActiveRecord::Migration
  def up
    create_table :reads do |t|
      t.references :user
      t.timestamps
    end
  end

  def down
    drop_table :reads
  end
end
