class ProjectGeometry < ActiveRecord::Migration
  def change
  	add_column :projects, :geometry, :text
  end
end
