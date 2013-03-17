require "test_helper"

class Web::UsersControllerTest < ActionController::TestCase

  test 'new user form' do
    get :new
    assert_response :success
    assert_template :new
  end

  test 'create user form' do
    assert_difference 'User.count' do
      post :create, user: { name: "tester", password: "123", password_confirmation: "123"}
    end
  end

  # test 'update user' do
  #   user = User.create(name: "test")
  #   put :update, id: user.id, user: {name: "tester2"}  
  #   assert_equal "tester2", User.find(@story.id).name
  #   assert_response :redirect
  # end

   test 'show user info' do
     user = User.create(name: "test")
     get :show, id: user.id
     assert_response :success
   end

  test 'delete user' do
    user = User.create(name: "test")
    assert_difference 'User.active.count', -1 do
      post :destroy, id: user.id
    end
  end
end
