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
    @comment.save!
    post :destroy, id: @comment.id
    assert_response :redirect
    refute StoryComment.find_by_id @comment
  end

end
