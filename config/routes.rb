Rails.application.routes.draw do
  resources :searches, only:[:index]
  
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 
  
  devise_scope :user do
    get "user/:id", :to => "users/registrations#detail"
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end

  root 'posts#index'

  resources :users, :only => [:show] do
    member do
      get 'favorite'
    end
  end

  resources :posts do
    resources :comments, only: [:create]
    resources :favorites, only: [:create, :destroy]
    collection do
      get 'index_list'
    end
  end

end
