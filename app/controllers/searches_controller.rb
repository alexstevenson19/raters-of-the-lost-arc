class SearchesController < ApplicationController
  include SearchesHelper

  protect_from_forgery except: :show

  def show
    search_array = strings_to_search(params[:search_string])
    if params[:search_type] == "Films"
      @search_return = film_search(search_array)
    else
      @search_return = review_search(search_array)
    end
  end

end