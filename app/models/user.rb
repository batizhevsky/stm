class User < ActiveRecord::Base
  attr_accessible :name
  has_many :stories
  has_many :comments, class_name: "StoryComment"

  scope :active, -> { where active: true }

  validates :name, uniqueness: true 

  def deactivate
    update_attribute :active, false
  end

end
