Rails.application.routes.draw do
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new', as: :login
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: :logout

  resources :users
  resources :debates do
    resources :comments do
      resources :votes
    end
  end
  root 'sessions#new'
end
