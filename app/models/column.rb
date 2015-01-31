class Column < ActiveRecord::Base
  belongs_to :project

  def name
  	"{section} column"
  end
end
