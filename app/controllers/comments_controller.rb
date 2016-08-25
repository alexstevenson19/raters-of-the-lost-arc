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
      redirect_to "/#{@comment.commentable_type.downcase}s/#{@comment.commentable_id}"
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
    redirect_to "/#{type.downcase}s/#{id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :commentable_type, :commentable_id, :commenter_id)
  end

end
