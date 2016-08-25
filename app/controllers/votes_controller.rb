class VotesController < ApplicationController

  def create
    review = Review.find(params[:id])
    author = review.reviewer
    if current_user && current_user.id != author.id &&

  end
end
