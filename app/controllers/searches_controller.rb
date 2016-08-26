class SearchesController < ApplicationController

  protect_from_forgery except: :show

  def show
    # if param[:search_type] == "Film"
      #search film title, description, release_year
    # elsif param[:search_type] == "Review"
      #search review headline, content, reviewer
    # end
  end

end