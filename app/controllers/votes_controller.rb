class VotesController < ApplicationController

  def create
    @review = Review.find(params[:id])
    author = @review.reviewer
    if current_user && current_user.id != author.id && !current_user.voted?(@review.id)
      Vote.create(voter_id: current_user.id, review_id: @review.id)
      redirect_to review_path(id: @review.id, film_id: @review.film.id)
    else
      @errors = ["You can't vote!"]
      redirect_to review_path(id: @review.id, film_id: @review.film.id)
    end
  end
end
