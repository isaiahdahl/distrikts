Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :distrikts, only: [:index, :show, :new, :create] do
    get :autocomplete_distrikt_name, :on => :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
