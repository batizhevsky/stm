require 'test_helper'

class Web::CommentsControllerTest < ActionController::TestCase
  setup do
    @user = create :user_type
    @comment = StoryComment.new(user: @user, story: create(:story))
  end

  test "should create comment" do
    sign_in @user
    puts @comment_attr
    post :create, comment: { story_id: @comment.story.id, comment: @comment.comment }
    assert_response :redirect
  end

  test "destory comment" do
    sign_in @user
    @comment.save!
    post :destroy, id: @comment.id
    assert_response :redirect
    refute StoryComment.find_by_id @comment
  end

end
