class User < ActiveRecord::Base
  attr_accessible :name
  has_many :stories
  has_many :comments, class_name: "StoryComment"

  scope :active, -> { with_state :active }

  validates :name, uniqueness: true 
  
  state_machine initial: :active do
    event :deactivate do
      transition active: :deleted
    end
  end

end
