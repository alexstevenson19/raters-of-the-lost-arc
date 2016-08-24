Rails.application.routes.draw do
<<<<<<< HEAD

  get "users" => "users#index"

  get "users/new" => "users#new"

  post "users" => "users#create"
=======
  root 'films#index'
  get 'films' => 'films#index'
  get 'films/:id' => 'films#show', as: 'film'
>>>>>>> 5b73811251ba9170ba3b7c2ff7ba0e0443e36e2a
end
