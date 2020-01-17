Rails.application.routes.draw do
  root to: 'products#index'
  resources :products, only: [:index, :show]
  resources :tests, only: [:index, :new, :create]
  get '/tmp', to: 'tmps#index'
  get '/logout', to: 'logouts#index'
  resource :mypage, only: [:show] do
    collection do
      get :identification
      get :profile
      get :card
    end
  end
end
