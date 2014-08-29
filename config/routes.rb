Rails.application.routes.draw do
  resources :users, only: [:index, :new, :create, :edit]
  get 'signup', to: 'users#new', as: 'signup'
end
