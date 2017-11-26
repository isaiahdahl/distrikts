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
    resources :places, only: [:new, :create] do
      resources :reviews, only: [ :new, :create ]
    end
    member do
      put 'visit', to: "distrikts#visit"
      put 'wishlist', to: "distrikts#wishlist"
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
