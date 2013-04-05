require "test_helper"

class Web::UsersControllerTest < ActionController::TestCase

  def setup
    @user = create(:user_type)
    sign_in @user
  end
  test 'new user form' do
    get :new
    assert_response :success
    assert_template :new
  end

  test 'create user form' do
    assert_difference 'User.count' do
      
      post :create, user: { name: "new_user", password: "123", password_confirmation: "123"}
    end
  end

  test 'anonymous cant create user' do
    skip
  end

  test 'update user' do
    skip
    user = User.create(name: "test")
    put :update, id: user.id, user: {name: "tester2"}  
    assert_equal "tester2", User.find(@story.id).name
    assert_response :redirect
  end

   test 'show user info' do
     get :show, id: @user.id
     assert_response :success
   end

  test 'delete user' do
    assert_difference 'User.active.count', -1 do
      post :destroy, id: @user.id
    end
  end

  test 'not signed user cant delete user' do
    sign_out
    skip
  end
end
