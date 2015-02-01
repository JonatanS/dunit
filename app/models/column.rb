class Column < ActiveRecord::Base
  belongs_to :project
  has_many :comments, :as => :subject
  include Buildable
  include Commentary

  def name
  	"#{section} column"
  end
end
