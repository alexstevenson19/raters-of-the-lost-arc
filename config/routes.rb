Rails.application.routes.draw do


  get "users" => "users#index"

  get "users/new" => "users#new"

  post "users" => "users#create"

  get "users/:id" => "users#show", as: "user"

  root 'films#index'
  get 'films' => 'films#index'
  get 'films/:id' => 'films#show', as: 'film'

  get "sessions/new" => "sessions#new"

  post "sessions" => "sessions#create"

  delete "sessions" => "sessions#destroy"
  get "films/:id/reviews/new"  => "reviews#new", as: 'reviews_new'
  post "films/:id/reviews" => 'reviews#create', as: 'reviews'
  get "reviews/:id" => 'reviews#show', as: "review"

end
