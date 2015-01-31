module CommentsHelper
  def comment_box element
  	form_tag element.comments.new, :remote => true, :class => 'quick-comment' do
  	  text_field(:comment, :message) +
  	  submit_tag("Add Comment")
  	end
  end

end
