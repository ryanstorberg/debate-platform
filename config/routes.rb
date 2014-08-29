Rails.application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'users#login', as: 'login'
  resources :users, only: [:index, :new, :create, :edit]
end
