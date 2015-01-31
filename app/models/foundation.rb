class Foundation < ActiveRecord::Base
  belongs_to :project
  has_many :comments, :as => :subject
  
  def name
  	"foundation #{foundation_type}"
  end
end
