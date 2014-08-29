Rails.application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: ''
  resources :users, only: [:index, :new, :create, :edit]
end
