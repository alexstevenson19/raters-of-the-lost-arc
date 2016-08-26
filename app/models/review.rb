class Review < ActiveRecord::Base
  belongs_to :reviewer, class_name: :User
  belongs_to :reviewable, polymorphic: true
  belongs_to :film, foreign_key: :reviewable_id

  has_one :genre, through: :film
  has_many :votes
  validates :headline, :content, :stars, :reviewer_id, presence: true
  has_many :comments, as: :commentable
  has_many :commenters, through: :comments

  def stars_pretty
    star_string = ""
    return Emoji.find_by_alias("poop").raw if self.stars == 1
    return  five_cats if self.stars == 5
    self.stars.times { star_string << Emoji.find_by_alias("star").raw }
    return star_string
  end

  def five_cats
    string = ""
    5.times {string << Emoji.find_by_alias("smiley_cat").raw}
    string
  end

  def short_content
    pizza = self.content[0..150].gsub(/\s\w+$/, '...')
    p pizza
  end

end
