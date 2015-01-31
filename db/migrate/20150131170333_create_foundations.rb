class CreateFoundations < ActiveRecord::Migration
  def change
    create_table :foundations do |t|
      t.string :revit_id
      t.boolean :done
      t.text :details
      t.string :material
      t.string :foundation_type
      t.float :angle

      t.timestamps null: false
    end
  end
end
