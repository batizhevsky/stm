require 'factory_girl'

FactoryGirl.define do
  factory :user_type do
    name "tester"
    password "god"
    password_confirmation "god"
  end

  factory :user do
    name "simple user"
  end

  factory :story do
    body 'test body'
    user
  end

  factory :story_comment do
    comment "test comment"
    user
    story
  end

end
