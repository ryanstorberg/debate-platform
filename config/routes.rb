Rails.application.routes.draw do
  resources :debates do
    resources :comments
  end

   root 'debates#index'
end
