class StoryComment < ActiveRecord::Base
  attr_accessible :comment, :story, :user
  belongs_to :user
  belongs_to :story
end
