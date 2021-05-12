Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'
    root to: "home#index"
  resources :tweets  do 
    collection do
      get 'search'
    end
    resources :comments ,only: [:create,:edit,:update,:destroy]
  end   
  resources :users,only: [:show,:edit,:update]
end
