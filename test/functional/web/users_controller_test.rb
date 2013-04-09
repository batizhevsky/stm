require "test_helper"

class Web::UsersControllerTest < ActionController::TestCase

  def setup
    @user = create :user_type
    @user_attr = attributes_for :user_type

    sign_in @user
  end

  test 'new user' do
    get :new

    assert_response :success
  end

  test 'create user' do
    post :create, user: @user_attr

    assert_response :redirect
  end

  test 'update user' do
    put :update, id: @user, user: {name: @user_attr[:name]}

    assert User.exists?(name: @user_attr[:name])
    assert_response :redirect
  end

  test 'show user info' do
    get :show, id: @user

    assert_response :success
   end

  test 'delete user' do
    post :destroy, id: @user

    assert !User.active.exists?(@user)
    assert_response :redirect
  end

  test "on update user if not auth redirect" do
    sign_out

    put :update, id: @user.id, user: {name: @user_attr[:name]}

    assert !User.active.exists?(name: @user_attr[:name])
    assert_redirected_to new_session_url
  end

  test "on delete user if not auth redirect" do
    sign_out

    post :destroy, id: @user

    assert User.active.exists?(@user)
    assert_redirected_to new_session_url
  end

end
