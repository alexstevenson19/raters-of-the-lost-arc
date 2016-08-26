class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  def show
    p current_user
    p logged_in?
    if logged_in? && current_user.id == params[:id].to_i
      @user = User.find(params[:id])
      render :show
    else
      redirect_to "/"
    end

  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
