class RenameAttendingToAttendance < ActiveRecord::Migration
  def up
    rename_table :attendings, :attendances
  end

  def down
    rename_table :attendances, :attendings
  end
end
