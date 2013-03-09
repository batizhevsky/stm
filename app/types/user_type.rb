class UserType < User
  include BaseType
   
  attr_accessible :name, :password, :password_confirmation
  has_secure_password 
end

