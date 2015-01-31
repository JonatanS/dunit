class AdditionalElementFields < ActiveRecord::Migration
  def change
  	add_column :columns, :level_name, :string
  	add_column :walls, :level_name, :string
  end
end
