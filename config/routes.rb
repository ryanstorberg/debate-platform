Rails.application.routes.draw do
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  resources :users, only: [:index, :new, :create, :edit]
  resources :debates do
    resources :comments
  end

   root 'debates#index'
end
