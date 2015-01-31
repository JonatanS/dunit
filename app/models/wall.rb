class Wall < ActiveRecord::Base
  belongs_to :project
  has_many :comments, :as => :subject

  def name
  	"#{wall_type} wall"
  end
end
