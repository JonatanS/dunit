class CommentsCanBeResolved < ActiveRecord::Migration
  def change
  	add_column :comments, :resolved, :boolean
  end
end
