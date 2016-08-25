require 'bcrypt'

class User < ActiveRecord::Base

  has_many :reviews, foreign_key: :reviewer_id
  has_many :reviewed_films, through: :reviews, source: :film
  has_many :votes, foreign_key: :voter_id
  has_many :review_upvotes, through: :reviews, source: :votes


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

  def vote_total
    self.review_upvotes.count
  end

  def verified?
    self.vote_total >= 5
  end

   def voted?(review_id)
    self.votes.where(review_id: review_id).count > 0
  end
end
