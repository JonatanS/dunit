module Commentary
  def comments_dump
  	JSON.generate comments.not_flagged.map do |comment|
  	  {
  	  	:revit_id => comment.subject.revit_id,
  	  	:comment_author => comment.user.name_with_email,
  	  	:created_at => comment.created_at,
  	  	:message => comment.message
  	  }
  	end
  end
end
