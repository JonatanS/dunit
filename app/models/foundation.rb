class Foundation < ActiveRecord::Base
  belongs_to :project
  def name
  	"foundation #{foundation_type}"
  end
end
