class Room < ActiveRecord::Base
  belongs_to :project
  has_many :comments, :as => :subject

  def name
  	"room #{name}"
  end
end
