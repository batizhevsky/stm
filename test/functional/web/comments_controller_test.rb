require 'test_helper'

class Web::CommentsControllerTest < ActionController::TestCase
  setup do
    @user = create :user_type
    @comment = create :story_comment
  end

  test "should create comment" do
    sign_in @user
    assert_difference 'StoryComment.count' do
      post :create, comment: { story_id: @comment.story.id, comment: @comment.comment }
    end
    assert_response :redirect
  end


  test "destory comment" do
    sign_in @user
    post :destroy, id: @comment.id
    assert_response :redirect
    refute StoryComment.find_by_id @comment
  end

  test "delete if use not auth requre redirect" do
    sign_out
    assert_difference 'StoryComment.count', 0 do
      delete :destroy, id: @comment.id
    end
    assert_redirected_to new_session_url
  end

  test "create if use not auth requre redirect" do
    sign_out
    assert_difference 'StoryComment.count', 0 do
      delete :create, comment: { story_id: @comment.story.id, comment: @comment.comment }
    end
    assert_redirected_to new_session_url
  end

end
