class Review < ActiveRecord::Base
  belongs_to :reviewer, class_name: :User
  belongs_to :reviewable, polymorphic: true
  has_one :genre, through: :film
  validates :headline, :content, :stars, presence: true



end
