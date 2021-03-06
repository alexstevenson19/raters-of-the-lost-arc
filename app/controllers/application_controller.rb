class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :ensure_login!, :top_movies, :recent_reviews

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user != nil
  end

  def ensure_login!
    redirect_to "/sessions/new" unless logged_in?
  end

  def top_movies
    top = Film.all.to_a.sort_by(&:average_rating).reverse!
    return top[0..4]
  end

  def recent_reviews
    a = Review.order(created_at: :desc).limit(5)
    a.to_a
  end
end
