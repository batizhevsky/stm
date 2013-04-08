require "test_helper"

class Web::StoriesControllerTest < ActionController::TestCase
  def setup
    user = create :user
    sign_in user

    @story = create :story
  end

  test "get index" do
    get :index

    assert_response :success
  end

  test "get filtered input" do
    get :index, story: { user: @story.user, state: @story.state }

    assert_response :success
  end

  test "should put update" do
    test_story = create(:story)
    put :update, id: test_story.id, story: { body: "new body" }
    assert_equal "new body", Story.find(test_story.id).body
    assert_response :redirect
  end

  test "should post create" do
    test_story_attr = attributes_for(:story)
    assert_difference('Story.count') do
      post :create, story: { body: test_story_attr[:body] }
    end
  end

  test "should get show" do
    test_story = create(:story)
    get :show, id: test_story.id
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "update state" do
    test_story = create(:story)
    post :event, id: test_story.id, event: "start"
    test_story.reload
    assert_response :redirect
    assert_equal test_story.state, "started"
  end

  test "on create if not auth redirect" do
    sign_out
    assert_difference 'Story.count', 0 do
      post :create, post: {story: 'test'}
    end
    assert_redirected_to new_session_url
  end

end
