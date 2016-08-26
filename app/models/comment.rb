class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :commenter, class_name: "User"

  def review_comment_author_id
    if self.commentable_type == "Review"
      return Review.find(self.commentable_id).reviewer_id
    else
      return nil
    end
  end

end