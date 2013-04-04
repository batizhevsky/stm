require "test_helper"

class Web::StoriesControllerTest < ActionController::TestCase

  def setup
    @test_story = Story.create body: "test"
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should put update" do
    put :update, id: @test_story.id, story: { body: "new body" }
    assert_equal "new body", Story.find(@test_story.id).body
    assert_response :redirect
  end

  test "should post create" do
    assert_difference('Story.count') do
      post :create, post: {story: {body: "new story"}}
    end
  end

  test "should get show" do
    get :show, id: @test_story.id
    assert_response :success
    assert assigns(:story)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "update state" do
    post :event, id: @test_story.id, event: "start"
    @test_story.reload
    assert_response :redirect
    assert_equal @test_story.state, "started"
  end

end
