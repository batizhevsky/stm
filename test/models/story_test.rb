require "minitest_helper"

class StoryTest < ActiveSupport::TestCase
  def setup
    @story = Story.create(body: "test")
  end

  def test_state_initial
    assert_equal @story.state, "new"
  end

  def test_event_started
    @story.start
    assert_equal @story.state, "started"
  end

  def test_event_finish
    @story.state = "started"
    @story.finish
    assert_equal @story.state, "finished"
  end

  def test_event_accept
    @story.state = "finished"
    @story.accept
    assert_equal @story.state, "accepted"
  end

  def test_event_reject
    @story.state = "finished"
    @story.reject
    assert_equal @story.state, "rejected"
  end

  def test_event_startrd_again
    @story.state = "rejected"
    @story.restart
    assert_equal @story.state, "started"
  end


  def test_can_assigned_to_user
    user = User.create(name: "test")
    @story.user = user
    user.save
    assert_equal @story.user_id, user.id
  end
end
