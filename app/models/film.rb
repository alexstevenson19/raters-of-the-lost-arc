class Film < ActiveRecord::Base
  belongs_to :genre
  # has_many :roles
  # has_many :actors, through: :roles
  has_many :reviews, as: :reviewable
  has_many :reviewers, through: :reviews
  # has_many :comments, as: :commentable
  # has_many :commenters, through: :comments

  validates :genre_id, :title, :release_year, :description, presence: true
  validates_format_of :release_year, with: /\A\d{4}\z/, on: :save
end
