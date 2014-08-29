Rails.application.routes.draw do
  get 'signin', to: 'users#new', as: 'signup'
  resources :users, only: [:index, :new, :create, :edit]
end
