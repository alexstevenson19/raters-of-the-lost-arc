class Film < ActiveRecord::Base
  include EmojiHelper
  has_many :film_genres
  has_many :genres, through: :film_genres
  # has_many :roles
  # has_many :actors, through: :roles
  has_many :comments, as: :commentable
  has_many :commenters, through: :comments
  has_many :reviews, as: :reviewable
  has_many :reviewers, through: :reviews

  validates :title, :release_year, :description, presence: true
  validates_format_of :release_year, with: /\A\d{4}\z/, on: :save

  def average_rating
    sum = 0
    return 0 if self.reviews.count < 1
    self.reviews.each do |review|
        sum += review.stars
    end
   sum.to_f/self.reviews.count.to_f
  end

  def half_star(average)
    return nil if self.reviews.count < 1
    remainder = (average - average.floor.to_f).to_f
    if remainder < 0.25
      return ""
    elsif remainder < 0.5
      return "1/4"
    elsif remainder < 0.75
      return "2/4"
    else
      return "3/4"
    end
  end

  def star_display
    return "No " if self.reviews.count < 1
    star_num  = average_rating
    star_string = ""
    star_num.floor.times {star_string << Emoji.find_by_alias("star").raw}
    star_string
  end

  def display_quarter_star
    if average_rating == 1
      return "#{half_star(average_rating)} star"
    else
      return "#{half_star(average_rating)} stars"
    end
  end

end
