class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject, :polymorphic => true
  validates :subject, :presence => true

  scope :not_flagged, lambda { where(:hidden => nil) }
end
