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
    if @comment.save
      redirect to "/#{@comment.commentable_type}/#{@comment.commentable_id}"
    else
      @errors = @comment.errors.full_messages
      render 'new'
    end
  end

  # delete

  private
  def comment_params
    commenter_id = session[:user_id]
    p params
    commentable_type = (params[:commentable_type])
    commentable_id = (params[:commentable_id])
    params.require(:comment).permit(:body)
  end

end