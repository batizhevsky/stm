class User < ActiveRecord::Base
  attr_accessible :name
  has_many :stories
  has_many :comments, class_name: "StoryComment"
end
