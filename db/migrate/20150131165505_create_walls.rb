class CreateWalls < ActiveRecord::Migration
  def change
    create_table :walls do |t|
      t.string :revit_id
      t.boolean :done
      t.text :details
      t.string :wall_type
      t.float :height
      t.float :thickness
      t.string :material

      t.timestamps null: false
    end
  end
end
