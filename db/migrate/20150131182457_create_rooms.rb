class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :revit_id
      t.string :name
      t.string :number
      t.string :base_finish
      t.string :wall_finish
      t.string :ceiling_finish
      t.string :floor_finish
      t.integer :occupancy
      t.float :area
      t.string :level_name
      t.float :height
      t.integer :project_id
      
      t.timestamps null: false
    end
  end
end
