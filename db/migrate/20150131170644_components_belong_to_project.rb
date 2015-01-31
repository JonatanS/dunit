class ComponentsBelongToProject < ActiveRecord::Migration
  def change
  	add_column :walls, :project_id, :integer
  	add_column :beams, :project_id, :integer
  	add_column :braces, :project_id, :integer
  	add_column :columns, :project_id, :integer
  	add_column :floors, :project_id, :integer
  	add_column :foundations, :project_id, :integer
  end
end
