Rails.application.routes.draw do
  root to: 'products#index'
  resources :tests, only: [:index, :new, :create]
  get '/tmp', to: 'tmps#index'
  get '/mypage', to: 'mypages#index'
end
