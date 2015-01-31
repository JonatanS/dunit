class Foundation < ActiveRecord::Base
  belongs_to :project
  has_many :comments, :as => :subject
  include Buildable
  include Commentary

  def name
  	"foundation #{foundation_type}"
  end
end
