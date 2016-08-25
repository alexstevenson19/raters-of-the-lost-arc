require 'bcrypt'

class User < ActiveRecord::Base

  has_many :reviews, foreign_key: :reviewer_id
  has_many :reviewed_films, through: :reviews, source: :film


  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(input_password)
    self.password == input_password
  end
end
