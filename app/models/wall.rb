class Wall < ActiveRecord::Base
  belongs_to :project
  has_many :comments, :as => :subject
  include Buildable
  include Commentary

  def name
  	"#{wall_type} wall"
  end
end
