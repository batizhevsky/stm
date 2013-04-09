require 'factory_girl'

FactoryGirl.define do
  sequence :name do |n|
    "test_user#{n}"
  end

  factory :user do
    name
  end

  factory :user_type do
    name
    password "god"
    password_confirmation { |u| u.password }
  end

  factory :story do
    sequence(:body) { |n| "test body #{n}" }
    user
  end

  factory :story_comment do
    sequence(:comment) { |n| "test comment #{n}" }
    user
    story
  end

end
