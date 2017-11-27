Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  mount Attachinary::Engine => "/attachinary"
  
  devise_for :users, 
    controllers: { registrations: "users/registrations", omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
  
  get 'distrikts/explore', to: 'distrikts#explore'
  get 'answers/quiz', to: 'answers#quiz'
  get 'answers/results', to: 'answers#results'
  resources :distrikts, only: [:index, :show, :new, :create, :edit, :update] do
    get 'places/close', to: 'places#close'
    resources :places, only: [:new, :create, :show] do
      resources :reviews, only: [ :new, :create ]
    end
    member do
      put 'visit', to: "distrikts#visit"
      put 'wishlist', to: "distrikts#wishlist"
      put 'remove_visit', to: "distrikts#remove_visit"
      put 'remove_wishlist', to: "distrikts#remove_wishlist"
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
