Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  get 'users/me'
  get 'session/create'
  get 'session/destroy'
  root 'home#index'
  resources :boards
  resources :comments, only: [:create, :destroy]
end
