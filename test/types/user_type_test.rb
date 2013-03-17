require "test_helper"


class UserTypeTest < ActiveSupport::TestCase

  def test_user_auth_with_right_pass
    user = UserType.create(name: "tester", password: "123", password_confirmation: "123")
    assert_equal user.authenticate("123"), user
  end

  def test_user_not_auth_with_wrong_pass
    user = UserType.create(name: "tester", password: "123", password_confirmation: "123")
    assert_equal user.authenticate("wrong"), false
  end

end
