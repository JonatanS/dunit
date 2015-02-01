module Buildable
  #base = class that includes module
  def self.included(base)
    base.validates :revit_id, :uniqueness => true
  end
end
