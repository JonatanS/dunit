class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject, :polymorphic => true
  validates :subject, :presence => true

  scope :not_flagged, lambda { where(:hidden => nil) }

  def self.export_formatted_json comments
  	JSON.generate(comments.map do |comment|
  	  {comment.subject.revit_id => {
	  	  :revit_id => comment.subject.revit_id,
	  	  :comment_author => comment.user.name_with_email,
	  	  :created_at => comment.created_at,
	  	  :message => comment.message
	  	}
	  }
  	end)
  end
end
