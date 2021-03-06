require 'test_helper'

class Web::CommentsControllerTest < ActionController::TestCase
  setup do
    user = create :user_type
    sign_in user

    @comment_attr = attributes_for :story_comment
    @comment = create(:story_comment)
  end

  test "new comment" do
    get :new, story_id: @comment.story

    assert_response :success
  end

  test "should create comment" do
    post :create, story_id: @comment.story, story_comment: @comment_attr

    assert_response :redirect
  end


  test "destory comment" do
    delete :destroy, story_id: @comment.story, id: @comment

    assert_response :redirect
    assert !StoryComment.exists?(@comment)
  end

  test "delete if use not auth requre redirect" do
    sign_out

    delete :destroy, story_id: @comment.story, id: @comment

    assert_redirected_to new_session_url
  end

  test "create if use not auth requre redirect" do
    sign_out

    post :create, story_id: @comment.story, story_comment: @comment_attr

    assert_redirected_to new_session_url
  end

end
