class RenameReadToLearning < ActiveRecord::Migration
  def up
    rename_table :reads, :learnings
  end

  def down
    rename_table :learnings, :reads
  end
end
