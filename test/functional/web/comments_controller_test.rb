require 'test_helper'

class Web::CommentsControllerTest < ActionController::TestCase
  setup do
    user = create :user_type
    sign_in user

    @comment_attr = attributes_for :story_comment
    @story = create :story
    @comment = create :story_comment
  end

  test "should create comment" do
    post :create, comment: { story_id: @story, comment: @comment_attr[:comment] }

    assert_response :redirect
  end


  test "destory comment" do
    delete :destroy, id: @comment

    assert_response :redirect
    assert !StoryComment.exists?(@comment)
  end

  test "delete if use not auth requre redirect" do
    sign_out

    delete :destroy, id: @comment

    assert_redirected_to new_session_url
  end

  test "create if use not auth requre redirect" do
    sign_out

    post :create, comment: { story_id: @story, comment: @comment_attr[:comment] }

    assert_redirected_to new_session_url
  end

end
