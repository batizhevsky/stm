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

  test "should get show" do
    get :show, id: @story

    assert_response :success
  end

  test "should get new" do
    get :new

    assert_response :success
  end

  test "get filtered input" do
    get :index, story: { user: @story.user, state: @story.state }

    assert_response :success
  end

  test "should post create" do
    story_attr = attributes_for :story

    post :create, story: story_attr

    assert Story.exists?(body: story_attr[:body])
    assert_response :redirect
  end

  test "should put update" do
    story_attr = attributes_for :story

    put :update, id: @story, story: story_attr

    assert Story.exists?(body: story_attr[:body])
    assert_response :redirect
  end


  test "update state" do
    next_event = @story.state_paths.events.first
    post :event, id: @story, event: next_event

    assert_response :redirect
  end

  test "on create if not auth redirect" do
    sign_out
    story_attr = attributes_for :story

    post :create, post: story_attr

    assert !Story.exists?(body: story_attr[:body])
    assert_redirected_to new_session_url
  end

end
