require "test_helper"

class UserSigninTypeTest < ActiveSupport::TestCase
  def setup
    @user = create :user_type
  end
  test "user sign in" do
    user_model = UserSigninType.new(name: @user.name, password: @user.password)
    assert_equal user_model.try_sign, @user
  end

  test "wrong user cant signin" do
    user_model = UserSigninType.new(name: 'not_this_usee', password: @user.password)
    assert_equal user_model.try_sign, nil 
  end
end
