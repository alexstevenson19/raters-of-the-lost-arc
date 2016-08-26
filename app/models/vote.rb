class Vote < ActiveRecord::Base

  belongs_to :voter, class_name: :User, foreign_key: :voter_id
  belongs_to :review


end
