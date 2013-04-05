require "test_helper"

class Web::StoriesControllerTest < ActionController::TestCase

  test "get index" do
    create(:story)
    get :index
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
      post :create, post: {story: test_story_attr}
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

end
