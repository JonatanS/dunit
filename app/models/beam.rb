class Beam < ActiveRecord::Base
  belongs_to :project
  has_many :comments, :as => :subject

  def name
  	"#{section} beam"
  end

end
