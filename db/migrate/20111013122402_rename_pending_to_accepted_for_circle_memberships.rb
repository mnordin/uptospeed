class RenamePendingToAcceptedForCircleMemberships < ActiveRecord::Migration
  def change
    rename_column :circle_memberships, :pending, :accepted
    change_column_default :circle_memberships, :accepted, false
  end
end
