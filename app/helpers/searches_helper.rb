module SearchesHelper

  def strings_to_search(search_query)
    return_array = search_query.split(" ")
    return_array.concat(return_array.map{|str| str.downcase})
    return_array.concat(return_array.map{|str| str.upcase})
    return_array.concat(return_array.map{|str| str.capitalize})
    return return_array.uniq
  end

  def film_search(string_array)
    return_films = []
    string_array.each do |search_string|
      return_films.concat(Film.all.find_all {|film| film.title.include?(search_string)})
      return_films.concat(Film.all.find_all {|film| film.description.include?(search_string)})
      return_films.concat(Film.all.find_all {|film| film.release_year.to_s.include?(search_string)})
      end
    # return_films = return_films.uniq {|obj| obj.id}
    return order_by_hits(return_films)
  end

  def review_search(string_array)
    return_reviews = []
    string_array.each do |search_string|
      return_reviews.concat(Review.all.find_all {|review| review.headline.include?(search_string)})
      return_reviews.concat(Review.all.find_all {|review| review.content.include?(search_string)})
      return_reviews.concat(Review.all.find_all {|review| review.reviewer.username.include?(search_string)})
      end
    # return_reviews = return_reviews.uniq {|obj| obj.id}
    return order_by_hits(return_reviews)
  end

  def order_by_hits(object_array)
    counts = Hash.new 0
    object_array.each do |obj|
      counts[obj] += 1
    end
    return (Hash[counts.sort_by{|k, v| v}.reverse])
  end

end
