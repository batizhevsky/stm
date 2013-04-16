require 'test_helper'

class Api::StoriesControllerTest < ActionController::TestCase
  def setup
    @story = create :story

    user = attributes_for :user_type

    basic_auth(user)
  end

  test 'get all stories' do
    get :index, format: :json

    assert_response :success
  end

  test 'get single story' do
    get :show, format: :json, id: @story

    assert_response :success
  end

  test 'create story' do
    story_attr = attributes_for :story

    post :create, format: :json, story: story_attr

    assert_response :created
  end

  test 'update story' do
    story_attr = attributes_for :story

    put :update, format: :json, id: @story, story: story_attr

    assert_response :success
  end

  test 'delete story' do
    delete :destroy, format: :json, id: @story

    assert_response :success
  end

  private
  def basic_auth params
    UserType.create(params)
    @request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(params[:name],params[:password])
  end
end
