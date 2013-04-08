require "test_helper"

class Web::UsersControllerTest < ActionController::TestCase

  def setup
    user = create :user
    sign_in user
    @user_attr = attributes_for :user_type
  end

  test 'new user form' do
    get :new
    assert_response :success
  end

  test 'create uyser form' do
    assert_difference 'User.count' do
      post :create, user: { name: @user_attr[:name], password: @user_attr[:password], password_confirmation: @user_attr[:password] }
    end
  end

  test 'update user' do
    user = UserType.create @user_attr
    put :update, id: user.id, user: {name: "tester2"}  
    assert_equal "tester2", User.find(user.id).name
    assert_response :redirect
  end

  test 'show user info' do
    user = UserType.create @user_attr
    get :show, id: user.id
    assert_response :success
   end

  test 'delete user' do
    user = UserType.create @user_attr
    assert_difference 'User.active.count', -1 do
      post :destroy, id: user.id
    end
    assert_response :redirect
  end

  test "on update user if not auth redirect" do
    sign_out
    user = UserType.create @user_attr
    assert_difference 'User.count', 0 do
      put :update, id: user.id, user: {name: "tester2"}
    end
    assert_redirected_to new_session_url
  end

end
