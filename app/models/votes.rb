class Votes < ActiveRecord::Base

  belongs_to :voter class_name: :User
  belongs_to :review

  # def value
  # end

end
