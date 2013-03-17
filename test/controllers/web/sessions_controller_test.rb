require 'test_helper'

class Web::SessionsControllerTest < ActionController::TestCase
  setup do
    @user = create :user_type
  end

  test "get auth form" do
    get :new
    assert_response :success
  end

  test "should auth" do
    post :create, user: { name: @user.name, password: @user.password }
    assert_response :redirect
    assert signed_in?
  end

  test "signout" do
    sign_in @user
    post :destroy
    assert_equal signed_in?, false
    assert_response :redirect
  end
end

