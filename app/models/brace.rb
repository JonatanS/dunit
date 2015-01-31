class Brace < ActiveRecord::Base
  belongs_to :project

  def name
  	"{section} brace"
  end
end
