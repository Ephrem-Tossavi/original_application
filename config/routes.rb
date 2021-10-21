Rails.application.routes.draw do

  root 'homes#index'
  #get 'comments/create'
  resources :favorites
  resources :tags
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  resources :users, only: [:show, :edit, :index]

  get '/guess/:type', to: "guest_users#login", as: "guess_user"

  #root "posts#index"

  get '/search', to: "posts#search", as: "search_posts"
  get '/search_users', to: "users#search", as: "search_users"

  resources :posts do
    resources :comments
    collection do
      post :confirm
    end
  end
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
