require 'test_helper'

class Api::StoriesControllerTest < ActionController::TestCase
  def setup
    @story = create :story
  end

  test 'get all stories' do
    get :index, format: :json

    assert_response :success
  end

  test 'get single story' do
    get :show, format: :json, id: @story

    assert_response :success
  end

  test 'search by body' do
    get :search, format: :json, q: { body_eq: @story.body }

    assert_response :success
  end

end
