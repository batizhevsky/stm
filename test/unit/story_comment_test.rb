require "test_helper"

class StoryCommentTest < ActiveSupport::TestCase
  def setup
    @user = User.create name: "tester"
    @story = Story.create body: "test text"
    @comment = StoryComment.create(user: @user, story: @story)
  end

  def test_comment_should_link_to_user_and_story
    assert_equal @comment.user_id, @user.id
    assert_equal @comment.story_id, @story.id
  end

  def test_relationship_with_user
    assert_equal @user.comments, [@comment]  
  end

  def test_relationship_with_story
    assert_equal @story.comments, [@comment]  
  end
end
