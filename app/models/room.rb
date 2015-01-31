class Room < ActiveRecord::Base
  belongs_to :project
  has_many :comments, :as => :subject
  include Buildable
  include Commentary

  def name
  	"room #{name}"
  end
end
