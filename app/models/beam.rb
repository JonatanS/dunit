class Beam < ActiveRecord::Base
  belongs_to :project

  def name
  	"#{section} beam"
  end
end
