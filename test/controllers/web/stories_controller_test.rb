require "minitest_helper"

class Web::StoriesControllerTest < ActionController::TestCase

  def setup
    @story = Story.create body: "test"
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should put update" do
    put :update, id: @story.id, story: { body: "new body" }
    assert_equal "new body", Story.find(@story.id).body
    assert_response :redirect
  end

  test "should post create" do
    assert_difference('Story.count') do
      post :create, post: {story: {body: "new story"}}
    end
  end

  test "should get show" do
    get :show, id: @story.id
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end
end
