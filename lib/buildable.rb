module Buildable
  def self.included(base)
    base.validates :revit_id, :uniqueness => true
  end
end
