class SearchesController < ApplicationController

  protect_from_forgery except: :show

  def show
    search_query = params[:search_string]
    search_array = search_query.split(" ")
    search_array.concat(search_array.map{|str| str.downcase})
    search_array.concat(search_array.map{|str| str.upcase})
    search_array.concat(search_array.map{|str| str.capitalize})
    search_array = search_array.uniq
    @search_return = []
    if params[:search_type] == "Films"
      search_array.each do |search_string|
        @search_return.concat(Film.all.find_all {|film| film.title.include?(search_string)})
        @search_return.concat(Film.all.find_all {|film| film.description.include?(search_string)})
        @search_return.concat(Film.all.find_all {|film| film.release_year.to_s.include?(search_string)})
      end
    else
      search_array.each do |search_string|
        @search_return.concat(Review.all.find_all {|review| review.headline.include?(search_string)})
        @search_return.concat(Review.all.find_all {|review| review.content.include?(search_string)})
        @search_return.concat(Review.all.find_all {|review| review.reviewer.username.include?(search_string)})
      end
    end
  @search_return = @search_return.uniq {|obj| obj.id}
  end

end