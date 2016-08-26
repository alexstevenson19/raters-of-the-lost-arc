class ReviewsController < ApplicationController

  def index
    @reviews = recent_reviews
  end

  def new
    ensure_login!
    @review = Review.new
  end

  def create
    @review = Review.new(params[:review].permit(:headline, :stars, :content))
    @film = Film.find(params[:id])
    @review.reviewer_id = session[:user_id]

    if @review.save
      @film.reviews << @review
      redirect_to @film
    else
      render 'new'
    end
  end

  def show
    # @film = Film.find(params[:film_id])
    @review = Review.find(params[:id])
    @author = @review.reviewer
  end

  def create_vote
    @review = Review.find(params[:id])
    @author = @review.reviewer
    @film = @review.film
    if current_user && current_user.id != @author.id && !current_user.voted?(@review.id)
      Vote.create(voter_id: current_user.id, review_id: @review.id)
      render "show"
    end
  end

end
