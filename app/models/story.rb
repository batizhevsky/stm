class Story < ActiveRecord::Base
  attr_accessible :body, :state, :user
  belongs_to :user
  has_many :comments, class_name: "StoryComment"

  state_machine initial: :new do

    event :start do
      transition new: :started
    end

    event :finish do
      transition started: :finished
    end

    event :accept do
      transition finished: :accepted
    end

    event :reject do
      transition finished: :rejected
    end

    event :restart do
      transition rejected: :started
    end
  end
end
