class CreateColumns < ActiveRecord::Migration
  def change
    create_table :columns do |t|
      t.string :revit_id
      t.boolean :done
      t.text :details
      t.string :section
      t.string :material
      t.float :angle

      t.timestamps null: false
    end
  end
end
