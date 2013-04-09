class StoryType < Story
  include BaseType

   attr_accessible :body, :user_id
   validate :body, presence: true
end
