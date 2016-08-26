Rails.application.routes.draw do

  root 'films#index'

  get "users" => "users#index"

  get "users/new" => "users#new"

  post "users" => "users#create"

  get "users/:id" => "users#show", as: "user"

  get 'films' => 'films#index'

  get 'films/:id' => 'films#show', as: 'film'

  get "sessions/new" => "sessions#new"

  post "sessions" => "sessions#create"

  delete "sessions" => "sessions#destroy"

  # Review
  get "films/:id/reviews/new"  => "reviews#new", as: 'reviews_new'

  post "films/:id/reviews" => 'reviews#create', as: 'reviews'

  get "films/:film_id/reviews/:id" => 'reviews#show', as: "review"

  # Genres
  get 'genres' => 'genres#index'

  get 'genres/:id' => 'genres#show', as: 'genre'

  get '/comments/new' => 'comments#new', as: 'comments_new'

  post 'comments' => 'comments#create', as: 'comments'

  delete "comments/:id" => "comments#destroy", as: 'comments_destroy'

  post 'reviews/:id/votes' => "votes#create", as: 'create_vote'

  post '/search' => "searches#show", as: 'search'

end
