class CommentsController < ApplicationController

  def new
    @commentable_id = params[:commentable_id]
    @commentable_type = params[:commentable_type]
    if !session[:user_id]
      redirect_to "/sessions/new"
    end
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.commenter = User.find(session[:user_id])
    if @comment.save
      if @comment.commentable_type== "Film"
        redirect_to "/#{@comment.commentable_type.downcase}s/#{@comment.commentable_id}"
      else
        film_id = Review.find(@comment.commentable_id).reviewable_id
        redirect_to "/films/#{film_id}/reviews/#{@comment.commentable_id}"
      end
    else
      @errors = @comment.errors.full_messages
      render 'new'
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    type = comment.commentable_type
    id = comment.commentable_id
    comment.destroy
    p type
    p "!!!!!!!!!!!!!!!!!!!!"
    if type == "Review"
      p "type does indeed equal review"
      reviewable_id = Review.find(id).reviewable_id
      redirect_to "/films/#{reviewable_id}"
    else
      redirect_to "/#{type.downcase}s/#{id}"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :commentable_type, :commentable_id, :commenter_id)
  end

end
