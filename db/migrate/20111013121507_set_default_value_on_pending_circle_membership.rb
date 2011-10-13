class SetDefaultValueOnPendingCircleMembership < ActiveRecord::Migration
  def up
    change_column_default(:circle_memberships, :pending, true)
  end

  def down
    change_column_default(:circle_memberships, :pending, nil)
  end
end
