class CommentsController < ApplicationController

  def new
    if !session[:user_id]
      redirect "/sessions/new"
    else
      @comment = Comment.new
    end
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render 'show'
    else
      @errors = @comment.errors.full_messages
      render 'new'
    end
  end

  # delete

  private
  def comment_params
    commenter_id = session[:user_id]
    commentable_type = params[:type]
    commentable_id :
    params.require(:article).permit(:category_id, :title, :body, :price, :email, :tags_string)
  end

end
