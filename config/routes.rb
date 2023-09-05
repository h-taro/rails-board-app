Rails.application.routes.draw do
  root 'home#index'
  get 'mypage', to: 'users#me'
  post 'login', to: 'session#create'
  delete 'logout', to: 'session#destroy'

  resources :users, only: [:new, :create]
  resources :boards
  resources :comments, only: [:create, :destroy]

  namespace :admin do
    root to: 'dashboards#index'
    get 'login', to: "session#new"
    post 'login', to: "session#create"
    delete 'logout', to: "session#destroy"
  end
end
