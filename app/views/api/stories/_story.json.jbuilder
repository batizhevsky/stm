json.(story, :id, :body, :created_at, :state)

if story.user
  json.owner story.user, :id, :name, :state
end

json.comments story.comments do |comment|
  json.(comment, :id, :comment, :created_at)
  json.creator comment.user, :id, :name, :state
end
