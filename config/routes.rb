Rails.application.routes.draw do
  root to: 'products#index'
  resources :tests, only: [:index, :new, :create]
  get '/tmp', to: 'tmps#index'
  get '/logout', to: 'logouts#index'
  resource :mypage, only: [:show] do
    collection do
      get :identification
      get :profile
    end
  end
end
