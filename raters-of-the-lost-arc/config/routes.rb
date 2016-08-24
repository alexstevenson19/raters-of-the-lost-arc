Rails.application.routes.draw do
  root 'films#index'
  get 'films' => 'films#index'
  get 'films/:id' => 'films#show', as: 'film'
end
