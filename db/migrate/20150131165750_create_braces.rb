class CreateBraces < ActiveRecord::Migration
  def change
    create_table :braces do |t|
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
