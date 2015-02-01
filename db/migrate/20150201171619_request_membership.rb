class RequestMembership < ActiveRecord::Migration
  def change
  	add_column :memberships, :approved, :boolean
  end
end
