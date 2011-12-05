class CreateOffices < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.string :title
      t.string :lat
      t.string :lng

      t.timestamps
    end
  end
end
