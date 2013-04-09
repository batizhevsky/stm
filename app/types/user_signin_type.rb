class UserSigninType < User
  attr_writer :password
  include BaseType

  attr_accessible :password
  validates :password, presence: true

  def self.try_sign opt
    password = opt[:password]
    user_instance = self.new(opt)
    user_instance.authenticate(password)
  end

  def id
    find_user ? find_user.id : nil
  end

  def authenticate password
    find_user.authenticate(password) if find_user
  end

  private
  def find_user
    return nil unless name
    UserType.active.find_by_name(name.mb_chars.downcase)
  end

end
