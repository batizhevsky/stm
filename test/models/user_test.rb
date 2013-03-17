require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user = create :user
  end
  # assert_respond_to User, :password_digest  
  test 'cant create ununiq user' do
    assert !User.create(name: @user.name)
  end

  test 'scope active' do
    @user.active = false
    @user.save
    assert (not User.active.find_by_id(@user.id))
  end
end
