class Beam < ActiveRecord::Base
  belongs_to :project
  has_many :comments, :as => :subject
  include Commentary

  def name
  	"#{section} beam"
  end

end
