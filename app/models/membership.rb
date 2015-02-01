class Membership < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  scope :authorized, lambda { where(:approved => true) }

  attr_default :approved, false
end
