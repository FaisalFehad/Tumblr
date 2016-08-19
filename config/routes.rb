Rails.application.routes.draw do
  devise_for :users
  get '/users/', to: 'users#list'
  get '/users/:id', to: 'users#profile'

  resources :posts do
    resources :comments
  end
  root 'posts#index'
end
