class Review < ActiveRecord::Base
  belongs_to :reviewer, class_name: :User
  belongs_to :reviewable, polymorphic: true
  belongs_to :film, foreign_key: :reviewable_id

  has_one :genre, through: :film
  validates :headline, :content, :stars, :reviewer_id, presence: true
  has_many :comments, as: :commentable
  has_many :commenters, through: :comments

  def stars_pretty
    star_string = ""
    self.stars.times { star_string << Emoji.find_by_alias("star").raw }
    return star_string
  end

  def short_content
    pizza = self.content[0..200].gsub(/\s\w+$/, '...')
    p pizza
  end

end
