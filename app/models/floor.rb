class Floor < ActiveRecord::Base
  belongs_to :project

  def name
    "floor #{level_name}"
  end
end
