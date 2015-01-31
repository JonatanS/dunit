class Room < ActiveRecord::Base
  belongs_to :project

  def name
  	"room #{name}"
  end
end
