class CreateFloors < ActiveRecord::Migration
  def change
    create_table :floors do |t|
      t.string :revit_id
      t.boolean :done
      t.text :details
      t.string :level_name
      t.string :material
      t.float :thickness
      t.string :floor_type

      t.timestamps null: false
    end
  end
end
