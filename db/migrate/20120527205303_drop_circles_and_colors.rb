class DropCirclesAndColors < ActiveRecord::Migration
  def up
  	drop_table :colors
  	drop_table :circles
  	drop_table :circle_memberships
  end
end
