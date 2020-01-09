Rails.application.routes.draw do
  root to: 'products#index'
  resources :tests, only: [:index, :new, :create]
end
