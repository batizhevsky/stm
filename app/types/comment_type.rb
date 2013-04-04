class CommentType < StoryComment 
  include BaseType

  attr_accessible :story, :comment
  validate [:story, :comment], presence: true

end
