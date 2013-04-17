class StoryType < Story
  include BaseType

   attr_accessible :user_id, :state_event
end
