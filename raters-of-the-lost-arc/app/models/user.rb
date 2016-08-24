require 'bcrypt'

Class User < ActiveRecord::Base

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate
    @user = User.find_by_username(params[:username])
    if @user.password == params[:password]
      return true
    else
      return false
    end
  end
end
