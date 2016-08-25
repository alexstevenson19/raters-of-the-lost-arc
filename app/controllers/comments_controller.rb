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

end