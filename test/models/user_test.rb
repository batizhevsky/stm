require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user = create :user
  end
  # assert_respond_to User, :password_digest  
  test 'cant create ununiq user' do
    refute User.create(name: @user.name)
  end

  test 'scope active' do
    @user.delete
    refute User.active.find_by_id(@user.id)
  end

  test 'user create active' do
    assert @user.active?
  end

end
