class CreateCircles < ActiveRecord::Migration
  def change
    create_table :circles do |t|
      t.string :title
      t.boolean :public
      t.timestamps
    end

    create_table :circle_memberships do |t|
      t.boolean :share_score, :default => false
      t.boolean :favorite
      t.boolean :accepted, :default => false
      t.references :circle
      t.references :user
      t.references :color
      t.timestamps
    end
  end
end
