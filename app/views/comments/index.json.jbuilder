json.array!(@comments) do |comment|
  json.extract! comment, :id, :message, :user_id, :subject_type, :subject_id, :hidden
  json.url comment_url(comment, format: :json)
end
