class CommentType < StoryComment 
  include BaseType

  attr_accessible :story, :comment
  validate :story, presence: true
  validate :comment, presence: true

end
