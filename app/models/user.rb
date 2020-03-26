class User < ApplicationRecord
  require 'bcrypt'
  
  include BCrypt

  #def password
  #	debugger
   # @password ||= Password.new(password_hash)
  #end

  #def password=(new_password)
  	#debugger
    #@password = Password.create(new_password)
   # self.password= @password
  #end

  before_save :encrypt_password
 #def self.authenticate(name, password)
  #user = find_by_user_name(name)
  #if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
   # user
  #else
  #  nil
 # end
#end

def encrypt_password
  if self.password.present?
    self.password = BCrypt::Engine.generate_salt
    self.password = BCrypt::Engine.hash_secret(password, password)
  end
end 

#def self.authenticate(username,password)
 #@user = User.find_by_username(username)
 #return @user.password == password
#end
end
