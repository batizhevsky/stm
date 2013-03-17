class UserSigninType < User
  attr_writer :password
  include BaseType

  attr_accessible :name, :password
  validates :name, presence: true
  validates :password, presence: true

  def try_sign
    user = find_user
    user.authenticate @password if user
  end

  def id
    find_user ? find_user.id : nil
  end

  private
  def find_user
    return nil unless name
    UserType.active.find_by_name(name.mb_chars.downcase)
  end

end
   
