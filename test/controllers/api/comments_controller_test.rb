require 'test_helper'

class Api::CommentsControllerTest < ActionController::TestCase
  setup do
    @user = create :user_type
    @story = create :story
    sign_in @user
  end

  test "should create comment" do
    post :create, comment: { story_id: @story.id, comment: 'my comment' }
    assert_equal @story.comments.last.comment, 'my comment'
    assert_equal @story.comments.last.user.id, @user.id
  end

  test "should not create comment to wrong comment" do
    pre_count =  StoryComment.count
    assert_raises(ActiveRecord::RecordNotFound) {
      post :create, comment: { story_id: 123, comment: 'my comment' }
    }
    assert_equal pre_count, StoryComment.count  
  end

end
