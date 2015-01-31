class Wall < ActiveRecord::Base
  belongs_to :project

  def name
  	"#{wall_type} wall"
  end
end
