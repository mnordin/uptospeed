class AddOwnerToCircle < ActiveRecord::Migration
  def change
    add_column :circle_memberships, :owner, :boolean, :default => false
  end
end
