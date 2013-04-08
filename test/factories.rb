require 'factory_girl'

FactoryGirl.define do
  sequence :name do |n|
    "test_user#{n}"
  end

  factory :user_type do
    name "tester"
    password "god"
    password_confirmation "god"
  end

  factory :user do
    name
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
