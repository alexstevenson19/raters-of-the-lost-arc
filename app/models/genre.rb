class Genre < ActiveRecord::Base
  has_many :films
  # has_many :reviews, through: :films
end