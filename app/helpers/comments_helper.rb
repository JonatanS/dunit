module CommentsHelper
  def comment_box element
  	form_tag element.comments.new, :remote => true, :class => 'quick-comment' do
  	  text_field(:comment, :message) +
  	  submit_tag("Add Comment") +
  	  hidden_field(:comment, :subject_id, :value => element.id) +
  	  hidden_field(:comment, :subject_type, :value => element.class.name) +
  	  hidden_field(:comment, :user_id, :value => current_user.id)
  	end
  end
end
