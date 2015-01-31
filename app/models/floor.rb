class Floor < ActiveRecord::Base
  belongs_to :project
  has_many :comments, :as => :subject
  include Buildable
  include Commentary

  def name
    "floor #{level_name}"
  end
end
