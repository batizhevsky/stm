class UserType < User
  include BaseType

  has_secure_password
  attr_accessible :name, :password, :password_confirmation

  def name= name
    write_attribute(:name, name.mb_chars.downcase)
  end
end

