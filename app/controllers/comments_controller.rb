class CommentsController < ApplicationController

  def new
    @commentable_id = params[:commentable_id]
    @commentable_type = params[:commentable_type]
    if !session[:user_id]
      redirect_to "/sessions/new"
    end
  end

  def create
    p "in create method"
    p comment_params
    @comment = Comment.new(comment_params)
    @comment.commenter = User.find(session[:user_id])
    if @comment.save
      redirect_to "/#{@comment.commentable_type}/#{@comment.commentable_id}"
    else
      @errors = @comment.errors.full_messages
      render 'new'
    end
  end

  # delete

  private
  def comment_params
    # params[:comment][:commenter_id] = session[:user_id]
    params.require(:comment).permit(:body, :commentable_type, :commentable_id, :commenter_id)
    # return params[:comment] - NO because rails is looking for something from permit
  end

end
