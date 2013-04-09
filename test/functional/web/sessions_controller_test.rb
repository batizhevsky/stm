require 'test_helper'

class Web::SessionsControllerTest < ActionController::TestCase
  setup do
    @user_attr = attributes_for(:user_type)
    @user = UserType.create(@user_attr)
  end

  test "get auth form" do
    get :new

    assert_response :success
  end

  test "should auth" do
    auth_user_attr = @user_attr.except(:password_confirmation)
    post :create, user: auth_user_attr

    assert signed_in?
    assert_response :redirect
  end

  test "signout" do
    sign_in @user

    post :destroy

    assert !signed_in?
    assert_response :redirect
  end
end

