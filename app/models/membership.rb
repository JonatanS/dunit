class Membership < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  scope :authorized, lambda { where(:approved => true) }
  scope :unauthorized, lambda { where(:approved => false) }

  attr_default :approved, false
end
